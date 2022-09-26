package com.app.service;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.app.models.Cart;
import com.app.models.Customer;
import com.app.models.Order;
import com.app.models.OrderDetails;
import com.app.repos.OrderRepository;

@Service
public class OrderService {
	
	@Autowired private OrderRepository orepo;
	@Autowired private CartService cartsrv;
	@Autowired private CustomerService custsrv;
	@Autowired private OrderDetailsService odsrv;
	@Autowired private EmailSenderService emailSenderService;
	
	public List<Order> allOrders(){
		return orepo.findAll(Sort.by(Direction.DESC,"id"));
	}
	
	public List<Order> pendingOrders(){
		return orepo.findByStatusOrderByIdDesc("Pending");
	}
	
	public List<Order> allUserOrders(String userid){
		return orepo.findByUseridOrderByIdDesc(userid);
	}
	
	public Order getOrderDetails(int orderid) {
		return orepo.findById(orderid).get();
	}
	
	public void cancelOrder(int orderid) {
		odsrv.deleteAllItems(orderid);
		orepo.deleteById(orderid);
	}
	
	public void confirmOrder(int orderid) {
		Order order=orepo.getById(orderid);
		order.setStatus("Confirmed");
		orepo.save(order);
	}
	
	
	public int placeOrder(Order o,String userid) throws MessagingException {
		
		Customer customer=custsrv.findByUserId(userid);
		o.setUserid(userid);
		o.setCustomer(customer);
		Order order=orepo.save(o);
		List<Cart> cartitems=cartsrv.findItemsByUserId(userid);
		for(Cart c : cartitems) {
			OrderDetails od=new OrderDetails();
			od.setOrder(order);
			od.setOrderid(order.getId());
			od.setProduct(c.getProduct());
			od.setQty(c.getQty());
			od.setProdid(c.getProdid());
			od.setPrice(c.getProduct().getPrice());
			odsrv.saveItem(od);
		}		
		emailSenderService.triggerEmail(customer.getEmail());
		cartsrv.emptyCart(userid);
	
		
		return o.getId();
	}
	
	
}
