/* script.js */

function countryTestInput()
{
var errorMsg=document.getElementById("errorMsg");
var countryId=document.getElementById("country_id");
if(countryId.value.length<3)
{
errorMsg.value="Country id must be 3 digits";return false;
}
for(var i=0;i<3;i++)
{
if(countryId.value.substr(i,1)<"0"||countryId.value.substr(i,1)>"9")
{
errorMsg.value="Country id must be digits only";return false;
}
}
var countryName=document.getElementById("country_name");
if(countryName.value=="")
{
errorMsg.value="Country name must be entered";return false;
}
//Clear Error Message
errorMsg.value="";
return true;
}

function townTestInput()
{
var errorMsg=document.getElementById("errorMsg");
var townName=document.getElementById("town_name");
if(townName.value=="")
{
errorMsg.value="Town name must be entered";return false;
}
//Clear Error Message
errorMsg.value="";
return true;
}

function hotelTestInput()
{
var errorMsg=document.getElementById("errorMsg");
var townName=document.getElementById("hotel_name");
if(hotelName.value=="")
{
errorMsg.value="Town name must be entered";return false;
}
//Clear Error Message
errorMsg.value="";
return true;
}

function userTestInput()
{
var errorMsg=document.getElementById("errorMsg");
//Check User Name
var userName=document.getElementById("user_name");
if(userName.value=="")
{
errorMsg.value="User name must be entered";return false;
}
//Check User Password
var userPassword=document.getElementById("user_password");
if(userPassword.value.length<8)
{
errorMsg.value="Password must be 8 characters";return false;
}
//Clear Error Message
errorMsg.value="";
return true;
}

function imgTestInput()
{
	if ((img_name.value == "") || (new_img.scr == ""))  return false;
	return true;
}

function insrtTestInput()
{
	if ((instr_name.value == "") || (instr_desc.text == ""))  return false;
	return true;
}


function userTestLogon()
{
var userId=document.getElementById("user_id");
if(userId.value=="")
{
return false;
}
var userPassword=document.getElementById("user_password");
if(userPassword.value=="")
{
return false;
}
return true;
}

function userTestSearch()
{
var errorMsg=document.getElementById("errorMsg");
var id=document.getElementById("id");
var firstName=document.getElementById("first_name");
var lastName=document.getElementById("last_name");
var cob=document.getElementById("cob");
var day=document.getElementById("day");
var month=document.getElementById("month");
var year=document.getElementById("year");
var status=document.getElementById("status");
//Check NOC
var noc=document.getElementById("noc");
if(noc.value==" " || noc.value=="  ")
{
errorMsg.value="Invalid NOC";return false;
}
if(noc.value<0 || (noc.value>0 && noc.value<1))
{
errorMsg.value="Invalid NOC";return false;
}
if(isNaN(noc.value))
{
errorMsg.value="Invalid NOC";return false;
}
//Check If User Entered Search Parameters
if(id.value=="" && firstName.value=="" && lastName.value=="" && cob.value=="000" && day.value=="00" && month.value=="00" && year.value=="0000" && status.value=="0" && noc.value=="")
{
errorMsg.value="No search parameter entered";return false;
}
//Clear Error Message
errorMsg.value="";
return true;
}

function hideBigImage()
{
var opaqueDiv=document.getElementById("opaqueDiv");
var imageDiv=document.getElementById("imageDiv");
var bigImage=document.getElementById("bigImage");
bigImage.src="";
opaqueDiv.style.display="none";
imageDiv.style.display="none";
document.body.style.overflow="visible";
}

function positionBigImage()
{
var imageDiv=document.getElementById("imageDiv");
var bigImage=document.getElementById("bigImage");
imageDiv.style.marginLeft=bigImage.width/2*-1 + "px";
imageDiv.style.marginTop=bigImage.height/2*-1 + "px";
}

function showBigImage(img)
{
var opaqueDiv=document.getElementById("opaqueDiv");
var imageDiv=document.getElementById("imageDiv");
var bigImage=document.getElementById("bigImage");
bigImage.src="images/flags/128/" + img + ".png";
opaqueDiv.style.display="block";
imageDiv.style.display="block";
document.body.style.overflow="hidden";
}

	function load_Img (files) {
        var fr = new FileReader();
        fr.onload = function () {
            new_img.src = fr.result;
			img_src.value = "images/Instruments/" + files[0].name;
        }
        fr.readAsDataURL(files[0]);

	}
