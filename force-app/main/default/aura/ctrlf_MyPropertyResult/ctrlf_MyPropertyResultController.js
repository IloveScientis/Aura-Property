({

	fetchAllProperty : function(component, event, helper) {

	helper.fetchAllPropertyHelper(component, event, helper);	
	},
	ownerDetailsClick : function(component, event, helper){
		var eventSource = event.getSource();
		var proOwnerId = eventSource.get('v.value');
		component.set('v.proOwnerId',proOwnerId);
		component.set('v.openOwnerDetails',true);
	},
	closeOwnerModal : function(component, event, helper){
		component.set('v.openOwnerDetails',false);
	},
	feedbackClicked : function(component, event, helper){

	},
	NavigateToProDetails : function(component, event, helper){

	}


})