$('document').ready(function(){

  if($('#shipmentList').length){
    var myShipmentList = document.getElementById("shipmentList").getElementsByTagName("tr");
    for (i = 0; i < myShipmentList.length; i++){
      myShipmentList[i].addEventListener("click", activateItem);
    }
  }

  function activateItem(){
    var status = this.childNodes[5].innerHTML;
    console.log(status);
  }
});
