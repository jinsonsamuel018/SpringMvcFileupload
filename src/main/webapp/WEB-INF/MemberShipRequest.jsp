<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HeeraERP</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css"></c:url>'>

<!-- jQuery library -->
<script src='<c:url value="/resources/js/jquery-3.1.1.min.js"></c:url>'></script>

<!-- Latest compiled JavaScript -->
<script src='<c:url value="/resources/js/bootstrap.min.js"></c:url>'></script>

<script type="text/javascript">

$(document).ready(function(){
		
		/*
			When 'correspondenceAddress' id is checked values
			from 'permanent address'fields are placed inside correspondenceAddress.
		*/
		
	    $("#correspondenceAddress").click(function() {
	        if (this.checked) {
	        	
	        	
	           var permanentAddress = $("#permanentAddress").val();	           
	           var permanentCountry = $("#permanentCountry").val();          	           
	           var permanentState = $("#permanentState").val();	          	           
	           var permanentCity = $("#permanentCity").val();	           
	           var permanentPin = $("#permanentPin").val();   
	           
	           $("#addressLine1").val(permanentAddress);
	           $("#coreespondingCountry").val(permanentCountry);
	           $("#coreespondingState").val(permanentState);
	           $("#coreespondingCity").val(permanentCity);
	           $("#coreespondingPin").val(permanentPin);
	           
	           
	         
	        }
	    });
		
		
		
	    var assignValue = $("#assignMember").val();
	    //alert(assignValue);
	    if(assignValue == 'null'){
	    	
	    	 $.ajax({
	        		type : "GET",
	        		url : "assignMember",
	        		data : { assignMember : assignValue },
	        		success : function(response) {
						
	        			$("#otherMembers").html(response);
						
	        		},
	        		error : function(e) {
	        			alert('Error: ' + e);
	        		}
	        	}); 
	    	
	    }
	
	
		/*
			When 'assignMember' id is clicked according to values returned
			ajax is called and return a view page which is replaced
			in the id named 'otherMembers'.
		
		*/
		
		$("#assignMember").click(function() {
			
			var assignValue = $("#assignMember").val();
			
	         if (assignValue == 'ME' || assignValue == 'DSA' || assignValue == 'null') {
	        	
	        	// alert(assignValue);
	        	
	        	 $.ajax({
	        		type : "GET",
	        		url : "assignMember",
	        		data : { assignMember : assignValue },
	        		success : function(response) {
						
	        			$("#otherMembers").html(response);
						
	        		},
	        		error : function(e) {
	        			alert('Error: ' + e);
	        		}
	        	});  
	        	
	                   
	        }
	         
	    });

	
});

</script>

<style type="text/css">

body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #78aa1c;
}
h2{
	font-weight: 100;
	font-family: sans-serif;
    padding-top: 15px;
}

.header{

	background: green;
	color: white;
	height: 42px;
	font-size: 22px;

}

.main{

	margin-top: 0;
    background-color: white;
    width: 100%;
    margin-left: 0;
    height: auto;
    padding: 15px;
    padding-bottom: 30px;

}
.main1{
	
	width: 95%;
	margin-left: 6px;
	
}
.footer{
	
	margin-top: -16px;
	background-color: green;
	height: 40px;
	color: white;
	
}

.p{
	line-height:0;
	color: red;
}
.w{
	color: red;
}

.form{

	font-size: small;
    /* font-style: normal; */
    font-weight: bold;
    font-family: sans-serif;
}

#table1{
	    border-spacing: 8px;
}

.tdhead{
	background-color: #D3D3D3;
}
.sub{
	font-weight: 100;
}
.terms{
	height:100px;
	overflow:auto;
	border:1px solid #CCC;
	padding:5px;
}

td, th {
    padding:12px 10px 10px 0px;
    width: 32% !important;
}
input:not([type]), input[type="email" i], input[type="number" i], input[type="password" i], input[type="tel" i], input[type="url" i], input[type="text" i] {
		width:90% !important;
		border: 1px solid #908c8c;
}
textarea{
    height: 60px;
    width: 100%;
	border: 1px solid #908c8c;
	}
#mem_name{
	width: 100%;
}

select{
	width: 80%
}	
</style>

</head>
<body>
<div class="container-fluid">
	<div class="row">
	<div class="header">
		<img src='<c:url value="resources/images/headlogo.png"></c:url>'
			style="float: left;"> &nbsp;&nbsp;&nbsp; Welcome :
			<img alt=""  src='<c:url value="/member_photos/93057_thumbs-up.png"></c:url>' width="50">	
		
	</div>
	</div>
</div>


<div class="container">

<div class="row">
	<div class="main ">		
	
	<h2>Membership Request Form</h2>
	<p class="p">NB: Size of photo, signature and id proof must be less than 100KB.</p>
	<hr>
	
	<form:form action="memberValidation" commandName="memberRequest1"  class="form" enctype="multipart/form-data">
	
		<table id="table1" >
		
			<tr>
				<td colspan="6" class="tdhead">PERSONAL DETAILS</td>
			</tr>
			<tr>
				<td>NAME <font class="w">*</font><span class="sub w">(as per bank record)</span></td>
				
				<td><form:input path="mem_name" id="mem_name"/></td>
				<td><form:errors path="mem_name" cssClass="w"></form:errors></td>
				
				<td>FATHER'S / HUSBAND'S NAME<font class="w">*</font></td>
				<td><form:input path="mem_guardian" /></td>
				<td><form:errors path="mem_guardian" cssClass="w"/></td>
				
			</tr>
			<tr>
				<td>DATE OF BIRTH <font class="w">*</font></td>
				<td><form:input path="mem_dob"/></td>
				<td><form:errors path="mem_dob" cssClass="w"></form:errors></td>
				
				<td>MARITAL STATUS <font class="w">*</font></td>
				<td><form:radiobuttons path="mem_maritial_status" items="${martial_status1}" /></td>
				<td><form:errors path="mem_maritial_status" cssClass="w"></form:errors></td>
			</tr>
			
			<tr>
				<td>NO OF CHILDREN</td>
				<td><form:input path="no_of_children"/> </td>
				<td><form:errors path="no_of_children" cssClass="w" ></form:errors></td>
				
				<td>GENDER<font class="w">*</font></td>
				<td><form:radiobuttons path="mem_gender" items="${mem_gender1}"/></td>	
				<td><form:errors path="mem_gender" cssClass="w" ></form:errors></td>			
			</tr>
			<tr>
				<td>RELIGION <font class="w">*</font></td>
				<td><form:input path="religion" /></td>
				<td><form:errors path="religion" cssClass="w" ></form:errors></td>
				
				<td>CASTE</td>
				<td><form:select path="caste" id="caste">
					<form:option value="">--SELECT--</form:option>
					<form:options items="${caste1}"/>	
					</form:select>
				</td>
				<td><form:errors path="caste" cssClass="w"></form:errors></td>
				
			</tr>
			<tr>
				<td>EDUCATION</td>
				<td><form:select path="education">
						<form:option value="">--SELECT--</form:option>
						<form:options items="${education1 }"/>
					</form:select>
				</td>
				<td><form:errors path="education" cssClass="w"></form:errors></td>	
				
				<td>OCCUPATION</td>
				<td><form:select path="occupation">
					<form:option value="">--SELECT--</form:option>
					<form:options items="${occupation1}"/>
					</form:select>
				</td>
				<td><form:errors path="occupation" cssClass="w"></form:errors></td>				
			</tr>
			<tr>
				<td>UPLOAD PHOTO<font class="w">*</font></td>
				<td><input type="file" name="mem_image" ></td>
				<td><div class="w"><c:out value="${mem_image_error }"></c:out></div></td>				
			</tr>
			<tr>
				<td>PERMANENT ADDRESS <font class="w">*</font><br>
				<span class="sub w">(please do not enter your pincode, city, state, country here.)</span></td>
				<td colspan="3"><form:textarea path="mem_address" rows="5" cols="80" id="permanentAddress" /></td>
				<td><form:errors path="mem_address" cssClass="w"></form:errors></td>
			</tr>
			<tr>
				<td>COUNTRY <font class="w">*</font></td>
				<td><form:select path="nationality" id="permanentCountry">
						<form:option value="">--SELECT--</form:option>
						<form:options items="${countries}"/>
					</form:select>
				</td>
				<td><form:errors path="nationality" cssClass="w"></form:errors></td>
				
				<td>STATE<font class="w">*</font></td>
				<td><form:input path="mem_state" id="permanentState"/></td>
				<td><form:errors path="mem_state" cssClass="w"></form:errors></td>
				
			</tr>
			<tr>
				<td>CITY <font class="w">*</font></td>
				<td><form:input path="city" id="permanentCity"/></td>
				<td><form:errors path="city" cssClass="w"></form:errors></td>
				
				<td>PIN<font class="w">*</font></td>
				<td><form:input path="mem_pin" id="permanentPin"/></td>
				<td><form:errors path="mem_pin" cssClass="w"></form:errors></td>
				
			</tr>
			<%-- <tr>
				<td>TEL</td>
				<td><form:input path="mem_ph"/></td>
				<td></td>
				
				<td>MOBILE<font class="w">*</font></td>
				<td><select name="mobile_code" style="width: 50px;padding: 2px;">
					<option value=""></option>
					<option>+91</option>
					<option>+1</option>
					<option>+965</option>
					<option>+966</option>
					<option>+971</option>
					<option>+974</option>
				</select>
				<form:input path="mem_mobile"/><td>
				<form:errors path="mem_mobile" cssClass="w"></form:errors>
				
			</tr>
			<tr>
				<td>EMAIL <font class="w">*</font></td>
				<td><form:input path="mem_email"/></td>
				<td><form:errors path="mem_email" cssClass="w"></form:errors></td>
				
				<td>UPLOAD SIGNATURE<font class="w">*</font></td>
				<td><input type="file" name="upload_signature"></td>
				<td><div class="w"><c:out value="${upload_signature_error}"></c:out></div></td>
			</tr>
			<tr>
				<td>HOW DO YOU KNOW ABOUT HEERA GROUP<font class="w">*</font></td>
				<td><form:textarea path="know_about_heera" rows="5" cols="20"/></td>
				<td><form:errors path="know_about_heera" cssClass="w"></form:errors></td>
			</tr>
			
			<tr>
				<td colspan="6" class="tdhead">OFFICIAL DETAILS</td>
			</tr>
			<tr>
				<td>OFFICE ADDRESS</td>
				<td colspan="3"><form:textarea path="office_address" rows="5" cols="80"/></td>
				<td><form:errors path="office_address" cssClass="w"></form:errors></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>PIN</td>
				<td><form:input path="office_pin"/></td>
				<td></td>
			</tr>
			<tr>
				<td>OFFICE PHONE</td>
				<td><form:input path="office_phone" id="oph" /></td>
				<td><form:errors path="office_phone" cssClass="w"></form:errors></td>
				
				<td>TOTAL FAMILY INCOME</td>
				<td><form:select path="total_family_income_cur">
					<form:option value="">--</form:option>
					<form:options items="${total_family_income_cur1 }"/>
				</form:select>			
				<form:input path="total_family_income"/></td>
				<td><form:errors path="total_family_income_cur" cssClass="w"></form:errors>
					<form:errors path="total_family_income" cssClass="w"></form:errors>
				</td>
			</tr>
			
			<tr>
				<td>UPLOAD ID PROOF <font class="w">*</font></td>
				<td><input type="file" name="upload_id_proof">
				<br><font class="w sub">(Upload Passport copy if you are residing out of India.)</font>
				</td>
				<td><div class="w"><c:out value="${upload_id_proof_error }"></c:out></div></td>
			</tr>
			<tr>
				<td colspan="6"  class="tdhead">ADDRESS FOR CORRESPONDENCE
					<span style="margin-left: 260px;" > Same as Permanent address
					<input type="checkbox" name="same_as_permanent" id="correspondenceAddress"></span>
				</td>
				
			</tr>
			<tr>
				<td>ADDRESS LINE 1 <font class="w">*</font></td>
				<td colspan="3"><form:textarea path="corresp_address" rows="5" cols="80" id="addressLine1" /></td>
				<td><form:errors path="corresp_address" cssClass="w"></form:errors></td>
			</tr>
			<tr>
				<td>COUNTRY <font class="w">*</font></td>
				<td><form:select path="corresp_country" id="coreespondingCountry">
						<form:option value="">--SELECT--</form:option>
						<form:options items="${countries}"/>
					</form:select>
				</td>
				<td><form:errors path="corresp_country" cssClass="w"></form:errors></td>
				
				<td>STATE<font class="w">*</font></td>
				<td><form:input path="corresp_state" id="coreespondingState"/></td>
				<td><form:errors path="corresp_state" cssClass="w"></form:errors></td>
				
			</tr>
			<tr>
				<td>CITY <font class="w">*</font></td>
				<td><form:input path="corresp_city" id="coreespondingCity"/></td>
				<td><form:errors path="corresp_city" cssClass="w"></form:errors></td>
				
				<td>PIN<font class="w">*</font></td>
				<td><form:input path="corresp_pin" id="coreespondingPin"/></td>
				<td><form:errors path="corresp_pin" cssClass="w"></form:errors></td>				
			</tr>
			<tr>
				<td colspan="6" class="tdhead">PASSPORT DETAILS</td>
			</tr>
			<tr>
				<td>PASSPORT NO:</td>
				<td><form:input path="passport_no"/></td>
				<td><form:errors path="passport_no"></form:errors></td>
				
				<td>PASSPORT ISSUED AT</td>
				<td><form:input path="passport_issued_at"/></td>
				<td><form:errors path="passport_issued_at"></form:errors></td>				
			</tr>
			<tr>
				<td>PASSPORT ISSUED DATE</td>
				<td><form:input path="passport_issued_date"/></td>
				<td><form:errors path="passport_issued_date"></form:errors></td>
				
				<td>PASSPORT EXPIRES ON</td>
				<td><form:input path="passport_expiry"/></td>
				<td><form:errors path="passport_expiry"></form:errors></td>			
			</tr>
			<tr>
				<td colspan="6" class="tdhead">MEMBERSHIP DETAILS</td>
			</tr>
			<tr>
				<td>AMOUNT OF HOLDING(IF ANY)</td>
			<td colspan="6">
				INR:<form:input path="mem_holding_inr" cssStyle="width: 35% !important;"/>
				AED:<form:input path="mem_holding_aed" cssStyle="width: 35% !important;"/>
			</td>
			</tr>
			
			<tr>
				<td>AMOUNT APPLYING FOR <font class="w">*</font>:</td>
				<td>INR:<form:input path="mem_amt_applying_inr" cssStyle="width: 80% !important;"/>
				<form:errors path="mem_amt_applying_inr" cssClass="w"></form:errors></td>
				<td colspan="2">AED:<form:input path="mem_amt_applying_aed" cssStyle="width: 80% !important;"/>
				<form:errors path="mem_amt_applying_aed" cssClass="w"></form:errors></td>
			</tr>
			<tr style="width: 35% !important;">
				<td colspan="6" class="tdhead">ADDED BY</td>
			</tr>
			<tr>
				<td>Assign member under</td>
				<td>
					<select name="assignMember" id="assignMember">
						<option value="null">MySelf</option>
						<option value="ME">MarketingExecutive</option>
						<option value="DSA">DSA (Direct Selling Agent)</option>				
					</select>
				</td>
				
				<td colspan="2"><div id="otherMembers"></div></td>
			</tr> --%>
			<tr>
				<td>TERMS AND CONDITIONS</td>
			</tr>
			<tr>
				<td colspan="6">
				
						<div class="terms">
							1. HG TCN member must be above 18 years of age can be a Resident Indian, NRI or a foreigner.<br>
							2. HG TCN member must be a Muslim.<br>
							3. Nomination facility is available; up to two nominees are permissible to every member. However can extend if needed.<br>
							4. All supportive documents should be relevant to member/s.<br>
							5. Copy of Residence proof and Photo ID of the member/s and the nominee/s is required. Original of the same can also be demanded for verification.<br>
							6. HG will not bear any responsibility for any loss due to mistake in filling of the name and/or any detail in, any of the HG form.<br>
							7. All eligible benefits and gifts will be issued on the applicant name, which is filled in the enrollment form only.<br>
							8. HG reserves the right to terminate the enrollment if any of the document or the information submitted by the applicant is found to be unauthentic or in any other related case.<br>
							9. Member/s willing to change any details provided in enrollment form must fill the update form and consult HG for the same. Changes will be effected post two weeks from receiving the details.<br>
							10. Membership applications will be accepted on or before last working day of every month. Application will not be accepted after the specified date in any case.<br>
							11. One  time  registration  fees  will  be  charged  on  every membership  of  HG TCN @ 0.2% on membership amount (for Eg. : 200/- INR for every 1,00,000/- INR and respectively).<br>
							12. Registration fees for HG TCN are non-refundable.<br>
							13. HG strictly condemns the payment done by money earned from non-Islamic /illegal source, including interest/theft/burglary/or any other related action, which is against the constitution of the respective country.  HG  reserves  the  right  to  take necessary action in the respective case, and the action may be extended up to legal proceedings as per the case may be.<br>
							14. Payments are accepted only through bank, cash payments will not be accepted in any case.<br>
							15. Member/s are warned, not to hand over cash to any HG office/Executive/Person/ organization or any one, as HG restricts the acceptance of cash in any case. However, person willing for cash payment may deposit the amount in respective HG bank account and hand over the bank pay-in-slip with enrollment form to any HG office.<br>
							16. It is the accountability of HG TCN member/s to verify with their bank, whether  the  membership  amount  has  been  deducted  from  their  respective  bank account. HG takes no responsibility in case of non-remittance of money. HG reserves the right to impose penalty on the respective member up to the extent of loss.<br>
							17. No buy back proceeding will be affected within the lock-in period of respective TCN under any circumstances.<br>
							18. Buy back request shall be submitted one month prior from date of withdrawal on or before 1st of respective month, subject to completion of lock-in period.<br>
							19. HG TCN member/s is/are deemed to be continued unless and until buyback request is submitted or else if HG terminates the membership.<br>
							20. Withdrawal amount will be remitted to members account in the first week of every month along with the profit/loss of that particular TCN.<br>
							21. As per Almighty's order in the Holy Quran, "O you who believe! Whenever you enter into deals with one another involving future obligations for a certain term, write it down." (2:282), HG is bound to all the terms and conditions stated in the enrollment form of the respective TCN, and so is the member also eligible to terms and conditions mentioned in it.<br>
							22. HG, bound by the Islamic Law, will not pay any interest to any member under any circumstances.<br>
							23. HG TCN Member/s shall attend a minimum of five meetings out of twelve in a particular year to be well informed with updates.<br>
							24. HG reserves all the right to change/modify the terms and conditions without any prior notice, and the same will be effective thereafter.<br>
							25. <span style="color:#ce1400;">*Please make sure that you are listing the reason for cash deposit in bank as unit purchase of TCN A/ TCN E/ TCN G/TCN F.</span><br>
							26. Heera will not be responsible for any bank charges that is being deducted from the amount you transfer to us.<br>
							
							Note:We were only concentrating on Business trades.
					  </div>
				
				</td>
			</tr>
			
			<tr>
				<td>DECLARATION</td>
				
			</tr>
			<tr>
				<td colspan="6" width="100%">
					 I HAVE READ THE TERMS AND CONDITIONS OF HG AND THE SAME HAVE BEEN WELL EXPLAINED TO ME BY THE HG AUTHORITIES.
		             I AM ALSO AWARE THAT THE TERMS AND CONDITIONS OF HG ARE PRINTED OVERLEAF .I HERE BY AGREE TO ABIDE BY THEM I DECLARE THAT ALL ABOVE DETAILS PROVIDED BY ME ARE CORRECT TO THE BEST OF MY KNOWLDGE
				</td>
			</tr>
			<tr>
				<td width="100%" colspan="6">
					<input type="radio" />
					<label>I AGREE TO FULFILL ALL THE REQUISITES MENTIONED IN THE TERMS AND CONDITIONS OF HG</label>
				</td>	
			</tr>
			<tr>
				<td colspan="6"  align="center" >
					<input type="submit"class="btn btn-info"/>
				</td>
				
			</tr>					
		
		</table>
	
	</form:form>
	
	</div>
	</div>
	</div>
	<div class="footer" align="center">
						<p>© 2016 Heera Group | All rights Reserved | Powered By
							Suvantech</p>
					</div>
</body>
</html>