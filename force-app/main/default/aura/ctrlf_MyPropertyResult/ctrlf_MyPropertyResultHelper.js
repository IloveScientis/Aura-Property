({

fetchAllPropertyHelper : function(component, event, helper) {

var action = component.get('c.getLatestProperty');

        action.setCallback(this,function(response){

        var responseValues= response.getReturnValue();

            component.set('v.propertyList',responseValues);

            component.set('v.propertiesFound',true);

        });

        $A.enqueueAction(action,false);
},
fetchFilteredProperty:function(component, event, helper){
    console.log('inside fetchFilteredProperty');

    //get the parameter filter which set in event parameter

    var locFilter = event.getParam("locFilter");

        var bedRoomFilter = event.getParam("bedRoomFilter");

        var bathRoomFilter = event.getParam("bathRoomFilter");

        var budgetFilter = event.getParam("budgetFilter");

        console.log('locFilter'+locFilter);

         console.log('bedRoomFilter'+bedRoomFilter);

         console.log('bathRoomFilter'+bathRoomFilter);

         console.log('budgetFilter'+budgetFilter);

    //which action to fire to get my property filtererd result  - apex method= getSearchedProperty

    var action = component.get('c.getSearchedProperty');

        action.setParams({

            'location':locFilter,

            'bedroom':bedRoomFilter,

            'bathroom':bathRoomFilter,

            'maxbudget':budgetFilter

        });

        action.setCallback(this,function(response){

            var responseValues = response.getReturnValue();

            console.log('filtered poperty '+JSON.stringify(responseValues));

            component.set('v.propertyList',responseValues);

            component.set('v.propertiesFound',true);

           

        });

        $A.enqueueAction(action,false);

    
}

})