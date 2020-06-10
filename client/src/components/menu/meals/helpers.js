export function saveSelectMealAPI( props, currentMeal ) {
	const {
		      weekMenu,
		      currentPurchase,
		      MEAL_SELECT_API_URL
	      } = props;
	
	const {
		      purchase_id,
		      week_affected,
		      delivery_day,
		      meal_selection,
		      meals_selected
	      } = currentMeal;
	
	// set parameters for sending form
	console.log( 'meal_selection: ', meal_selection );
	let defaultSelected = meal_selection === 'SURPRISE';
	console.log( 'defaultSelected: ', defaultSelected );
	let purchaseID =
		    purchase_id !== undefined
			    ? purchase_id
			    : currentPurchase.purchase_id;
	let weekAffected =
		    week_affected !== undefined
			    ? week_affected
			    : weekMenu.SaturdayDate;
	let mealQuantities = meals_selected === undefined ? null : meals_selected;
	let deliveryDay = delivery_day === undefined ? 'Sunday' : delivery_day;
	//sending request to the server
	
	fetch( `${MEAL_SELECT_API_URL}/${purchaseID}`, {
		method:  'POST',
		headers: {
			Accept:         'application/json',
			'Content-Type': 'application/json'
		},
		body:    JSON.stringify( {
			purchase_id:      purchaseID,
			week_affected:    weekAffected,
			meal_quantities:  mealQuantities,
			delivery_day:     deliveryDay,
			default_selected: defaultSelected,
			is_addons:        false // distinguished between save Select and save Add Local Treats. can pass this as parameter if we don't want duplicated code.
		} )
	} );
}

export function saveAddonAPI( props, currentAddon ) {
	const {
		      weekMenu,
		      currentPurchase,
		      MEAL_SELECT_API_URL
	      } = props;
	
	const {
		      purchase_id,
		      week_affected,
		      meals_selected
	      } = currentAddon;
	
	let purchaseID =
		    purchase_id !== undefined
			    ? purchase_id
			    : currentPurchase.purchase_id;
	let weekAffected =
		    week_affected !== undefined
			    ? week_affected
			    : weekMenu.SaturdayDate;
	let addonQuantities = meals_selected === undefined ? null : meals_selected;
	fetch( `${MEAL_SELECT_API_URL}/${purchaseID}`, {
		method:  'POST',
		headers: {
			Accept:         'application/json',
			'Content-Type': 'application/json'
		},
		body:    JSON.stringify( {
			purchase_id:      purchaseID,
			week_affected:    weekAffected,
			addon_quantities: addonQuantities,
			is_addons:        true
		} )
	} ).then();
}

export function concatMealSelection( mealSelection, mealSelected ) {
	let newValue = ''; // create a new value for meal_selection
	for ( let key of Object.keys( mealSelected ) ) {
		let loop_times = parseInt( mealSelected[ key ] );
		for ( let i = 0; i < loop_times; i++ ) {
			if ( newValue === '' ) {
				newValue = newValue + key;
			} else {
				newValue = newValue + ';' + key;
			}
		}
	}
	return newValue;
}
