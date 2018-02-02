/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function valid(){
    var pas=document.getElementById('Pass').value;
    var repass=document.getElementById('Repass').value;
    if(pas.length>=8){
    if(pas!==repass){
        alert("Password does not match");
        return false;
    }
    else{
        return true;
    }
    }
    else{
        alert("Password must 8 character long");
        return false;
    }
}
function readURL(input) {
    document.getElementById('req').value="imgset";
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imageField')
                    .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
function image(){
document.getElementById('fileField').click();
    return false;
}
function dataEntry(){
    var pas=document.getElementById('pass').value;
    var repass=document.getElementById('repass').value;
    var email=document.getElementById('email').value;
    var cemail=document.getElementById('email2').value;
    var terms=document.getElementById('radio3');
    var terms1=document.getElementById('radio4');
   
    
    
    if(pas.length>=8){
		document.getElementById('span4').innerHTML="";
    if(pas!==repass){
        
		
		document.getElementById('span1').innerHTML="Not Match";
        return false;
    }
    else{
		document.getElementById('span1').innerHTML="";
        if(email!==cemail){
        document.getElementById('span2').innerHTML="Not Match";
        return false;
    }
    else{
		document.getElementById('span2').innerHTML="";
         if(terms.checked){
    var t=document.getElementById('radio3').value;
                    return true;
                    alert(t);    
    }
    else{
    var t1=document.getElementById('radio4').value;
            document.getElementById('span3').innerHTML=t1;    
                    return false;
    }
       
}
    }
    }
    else{
        document.getElementById('span4').innerHTML="At least 8 character";
        return false;
    }
  
}
function validate(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function AvoidSpace(event) {
    var k = event ? event.which : window.event.keyCode;
    if (k === 32) return false;
}
function pasteval(){
    var str=document.getElementById('userid').value;
    document.getElementById('userid').value=str.replace(/\s+/g, '');
    return true;
}