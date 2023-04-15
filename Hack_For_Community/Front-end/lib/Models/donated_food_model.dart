class DonateForm{
  String donorName='';
  String phoneNumber='';
  String address='';
  String email='';
  String food='';
  String quantity='';
  String bestbefore='';
  String selectedNGO='';
  String? donortoken = '';


  Map createJSON(DonateForm data){
      return{
        "donorName":data.donorName,
        "phoneNumber":data.phoneNumber,
        "address":data.address,
       "email":data.email,
       "food":data.food,
       "quantity":data.quantity,
       "bestbefore":data.bestbefore,
      "selectedNGO":data.selectedNGO,
        "donortoken": data.donortoken,
      };

  }
}

