({
    initFilter : function(component, event, helper) {

        var locationOption =[{label:'ALL',Value:'ALL'},

                             {label:'Banglore',Value:'Banglore'},

                            {label:'Hyderabad',Value:'Hyderabad'},

                             {label:'Mumbai',Value:'Mumbai'},

                             {label:'Pune',Value:'Pune'},

                             {label:'Bhubaneswar',Value:'Bhubaneswar'}

                            ];

        component.set('v.locationOptions',locationOption);

            var noOfBedRoomOptions = [{label:'ALL',value:'ALL'},

            {label:'1',value:'1'},

            {label:'2',value:'2'},

            {label:'3',value:'3'},

            {label:'4',value:'4'}];

               component.set('v.noOfBedRoomOptions',noOfBedRoomOptions);

            var noOfBathRoomOptions = [{label:'ALL',value:'ALL'},

            {label:'1',value:'1'},

            {label:'2',value:'2'},

            {label:'3',value:'3'},

            {label:'4',value:'4'}];

              component.set('v.noOfBathRoomOptions',noOfBathRoomOptions);

    },
    handleFilterChange : function(component, event, helper) {

        //lets find out which event to fire

        console.log('inside handleFilterChange');

        var filterEvent = component.getEvent("ctrlf_propertyFilterEvent");

        //set event parameters

        filterEvent.setParams( {

            "locFilter" : component.get("v.location") ,

             "bedRoomFilter" : component.get("v.noOfBedRoom") ,

             "bathRoomFilter" : component.get("v.noOfBathRoom") ,

             "budgetFilter" : component.get("v.maxBudget")

        } );

        //fire the event

        filterEvent.fire();

       console.log('inside handleFilterChange completed');

    }
})
