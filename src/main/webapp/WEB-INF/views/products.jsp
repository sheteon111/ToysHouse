<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<jsp:include page="Xheader.jsp"></jsp:include>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
                                            <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
                                            <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

<button type="button" class="btn btn-primary float-right btn-sm"
	data-toggle="modal" data-target="#addproduct">Add Product</button>
<h5 class="p-2" style="border-bottom: 2px solid purple;">Products</h5>
<jsp:include page="msg.jsp"></jsp:include>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Desc</th>
			<th>Price</th>
			<th>Item Category</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${prods }" var="p">
			<tr>
				<td>${p.prodid}</td>
				<td><img src="${p.pic}" class="mr-2"
					style="width: 80px; height: 60px;">${p.pname}</td>
				<td>${p.company}</td>
				
				<td>&#8377; ${p.price}</td>
				<td>${p.category.catname}</td>
				<td><a onclick="return confirm('Are you sure to delete this product ?')" href="/delprod/${p.prodid}"
					class="btn btn-danger btn-sm">Delete</a><br><br>
					<a onclick="return confirm('Are you sure to Edit this product ?')" href="/products/${p.prodid}"
					class="btn btn-primary btn-sm">Edit</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div class="modal fade" id="addproduct" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form method="POST" enctype="multipart/form-data">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-row">
						<div class="col-sm-6">
							<div class="form-group">
								<label> Name</label> <input type="text" name="pname"
									class="form-control">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Desc1</label> <input type="text" name="company"
									class="form-control">
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Desc2</label> <input type="text" name="salt"
									class="form-control">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<!-- <label>Launch Date</label> <input type="month" name="mfg"
									class="form-control"> -->
									<script type="text/javascript">
                                            $(function() {
                                            var date = new Date();
                                            var currentMonth = date.getMonth();
                                            var currentDate = date.getDate();
                                            var currentYear = date.getFullYear();
                                            $('#txtDate').datepicker({
                                            maxDate: new Date(currentYear, currentMonth, currentDate)
                                            });
                                            });
                                            </script>  
                                            
                                           <label>Launch Date</label>
                                            <input name="mfg" required type="text" id="txtDate" class="form-control" />
									
							</div>
						</div>
					</div>

					<div class="form-row">
						<div class="col-sm-6">
							<div class="form-group">
							<script type="text/javascript">
                                            $(function() {
                                            var date = new Date();
                                            var currentMonth = date.getMonth();
                                            var currentDate = date.getDate();
                                            var currentYear = date.getFullYear();
                                            $('#txtDate1').datepicker({
                                            maxDate: new Date(currentYear, currentMonth, currentDate)
                                            });
                                            });
                                            </script> 
								<label>Product Add Date</label> <input name="add" required type="text" id="txtDate1" class="form-control">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Quantity</label> <input type="text" name="qty"
									class="form-control">
							</div>
						</div>
					</div>

					<div class="form-row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Price</label> <input type="text" name="price"
									class="form-control">
							</div>
						</div>
						
						
						
						<div class="col-sm-6">
							<div class="form-group">
								<label>Category</label> <select name="catid" required
									class="form-control">
									<option value="">Select Category</option>
									<c:forEach items="${cats }" var="cat">
										<option value="${cat.catid}">${cat.catname}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>



					<div class="form-group">
						<label>Product Photo</label> <input type="file" name="photo"
							accept=".jpg,.png,.jpeg" class="form-control-file">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Save Product</button>
				</div>
			</form>
		</div>
	</div>
</div>
</div>

