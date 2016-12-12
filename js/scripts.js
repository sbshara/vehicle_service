// Add and remove attachment (input field) into a form table
var attachment = 1;
var limit = 10;
var addErr = false;
var remErr = false;

//alert("Shiblie");

function addInput(div){
    if(attachment <= limit){
        $(div + (attachment - 1)).after("<tr class='frm_new' id='frm" + attachment + "'><td><label>Attachment (" + attachment + ")</label></td><td id='addfile'><input type='file' name='attachment[]' id='attachment[]' /></td><td></td></tr>");
        if(remErr == true){
            $('#remErr').remove();
            remErr = false;
        }
        attachment++;
    } else {
        if(addErr == true){
            return false;
        } else {
            $("#frm1").before("<tr id='addErr'><td></td><td><p id='error_attachment' class='errornotification'>you have reached the limit of attachments!</p></td><td></td></tr>");
            addErr = true;
        }
    }
}

function removeInput(div){
    if(attachment <= 1){
        if(remErr == true){
            return false;
        } else {
            $("#attachtr").after("<tr id='remErr'><td></td><td><p id='error_attachment' class='errornotification'>Nothing to remove!</p></td><td></td></tr>");
            remErr = true;
        }
    } else {
        $('#frm' + (attachment - 1)).remove();
        $('#addErr').remove();
        addErr = false;
        attachment--;
    }
}

function pageLimit(object){
    var urlNew = window.location.href.toString();
    if(urlNew.substr(urlNew.length-3) == 'php'){
        window.location.href = window.location.href + "?pp=" + object.value;
    } else if(urlNew.substr(urlNew.length-5,2) == 'pp'){
        window.location.href = window.location.href + "&pp=" + object.value;
    } else{
        window.location.href = window.location.href + "&pp=" + object.value;
    }
}





// #############################################################
// #W3 school free template -- JS moved from page to this file #
// #############################################################

// Get the Sidenav
var mySidenav = $('#mySidenav');

// Get the DIV with overlay effect
var overlayBg = $('#myOverlay');

// Toggle between showing and hiding the sidenav, and add overlay effect
function w3_open() {
    if (mySidenav.style.display == "block") {
        mySidenav.style.display = "none";
        overlayBg.style.display = "none";
    } else {
        mySidenav.style.display = "block";
        overlayBg.style.display = "block";
    }
}

// Close the sidenav with the close button
function w3_close() {
    $('#mySidenav').style.display = "none";
    $('#overlayBg').style.display = "none";
}
// ############### END #########################################

$(window).load(function() {
	$(".loader").fadeOut("slow", function(){
        $('#loader').hide('blind', 3);
    });
})
