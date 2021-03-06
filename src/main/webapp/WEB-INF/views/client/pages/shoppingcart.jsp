<%@page import="stylish.entity.CartLineInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- BREADCRUMBS -->
<jsp:include page="../blocks/breadcrumbs.jsp" flush="true" />

<div class="space10"></div>

<!-- MAIN CONTENT -->
<div class="shop-single shopping-cart">
    <div class="container">
        <div class="row">
            <div id="error">
                ${error}
            </div>
            <div class="col-md-12 col-sm-12">
                <form method="POST" action="orders/updatecart.html">
                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>Product Image</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price for one</th>
                                <th>Product discount</th>
                                <th>Subtotal</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cartList}" var="item">
                                <tr>
                                    <td><img src="assets/images/products/${item.getProduct().getUrlImg()}" class="img-responsive" alt=""/></td>
                                    <td>
                                        <h4>
                                            <a href="${item.getProduct().productID}-${item.getProduct().productColorList[0].colorID}-${item.getProduct().productNameNA}.html">
                                                ${item.getProduct().productName}
                                            </a>
                                        </h4>
                                        <p>Size: ${item.getSizesByColor().getProductSize()}  |  Color:   
                                            <img fs-color="${item.getSizesByColor().getColor().colorID}" 
                                                 src="assets/images/products/colors/${item.getSizesByColor().getColor().getUrlColorImg()}" 
                                                 class="img-responsive" 
                                                 alt="${item.getSizesByColor().getColor().urlColorImg}" 
                                                 title="${item.getSizesByColor().getColor().getColor()}"
                                                 style="width: 20px; height: 20px; display: inline;"/>
                                        </p>
                                    </td>
                                    <td style="width: 100px;" align="center">
                                        <select id="select-quantity-shoppingcart" name="${item.getProduct().productID}-${item.getSizesByColor().getSizeID()}-${item.getSizesByColor().getColor().getColorID()}">
                                            <%
                                                CartLineInfo cartLineInfo = (CartLineInfo) pageContext.getAttribute("item");
                                                for (int i = 1; i < 11; i++) {
                                                    if (cartLineInfo.getQuantity() == i) {
                                            %>
                                            <option value="<%= i%>" selected="selected"><%= i%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%= i%>"><%= i%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </td>
                                    <td>
                                        <div class="item-price">$${item.getProduct().getPrice()}</div>
                                    </td>
                                    <td>
                                        <div class="item-price">-$${item.getProductDiscount()}</div>
                                    </td>
                                    <td>
                                        <div class="item-price">$${item.getSubTotal()}</div>
                                    </td>
                                    <td><a href="orders/deleteitemCart/${item.getProduct().productID}/${item.getSizesByColor().getSizeID()}/${item.getSizesByColor().getColor().getColorID()}.html"><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5" align="right" style="padding-left: 750px;"><strong>Grand Total</strong></td>
                                <td><strong>$${grandTotal}</strong></td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                    <div class="table-btn">
                        <a href="index.html" class="pull-left"><button class="btn-black" type="button">Continue Shopping</button></a>
                        <button type="submit" class="btn-black pull-right">Update Shopping Cart</button>
                    </div>
                </form>
                <div class="table-btn" style="padding-top: 10px;">
                    <button onclick="checkoutClick();" class="btn btn-danger pull-right" style="color: #fff !important;">PROCEED TO CHECKOUT</button>
                </div>
                <div class="clearfix space10"></div>
                <div class="space40"></div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix space20"></div> 
<!-- MODAL -->
<jsp:include page="../blocks/modal.jsp" flush="true" />