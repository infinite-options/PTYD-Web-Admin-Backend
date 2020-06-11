import React from 'react';
import { ButtonToolbar } from 'react-bootstrap';
import axios from 'axios';

import SelectMealModal from '../SelectMealModal';
import AddonModal from '../AddonModal';
import Buttons from './buttons';
import { concatMealSelection, saveAddonAPI, saveSelectMealAPI } from './helpers';


export default function Meals( props ) {
	const {
		      maxMeals,
		      weekMenu,
		      currentPurchase,
		      ChangeCurrentAddonCharge,
		      MEAL_SELECT_API_URL,
		      SetError
	      } = props;
	
	const [ currentMeal, setCurrentMeal ]         = React.useState( {} ),
	      [ currentAddon, setCurrentAddon ]       = React.useState( {} ),
	      [ totalAddonPrice, setTotalAddonPrice ] = React.useState( '0' ),
	      [ dayChosen, setDayChosen ]             = React.useState( undefined ),
	      [ optionChosen, setOptionChosen ]       = React.useState( undefined ),
	      [ addonChosen, setAddonChosen ]         = React.useState( false ),
	      [ buttonDisabled, setButtonDisabled ]   = React.useState( undefined ),
	      [ selectMealModal, setSelectMealModal ] = React.useState( false ),
	      [ addonModal, setAddonModal ]           = React.useState( false );
	
	function clickSurprise( first ) {
		//set properties for all other buttons
		setOptionChosen( 'surprise' );
		setSelectMealModal( false );
		setAddonModal( false );
		// update state for currentMealSelected
		setCurrentMeal( prev => ( {
			...prev,
			meal_selection: 'SURPRISE'
		} ) );
		//send a request to database
		if ( !first ) {
			saveSelectMealAPI( props, currentMeal );
		}
	}
	
	function clickDay( day, first ) {
		// set properties for other button
		setDayChosen( day );
		setButtonDisabled( undefined );
		setSelectMealModal( false );
		setAddonModal( false );
		// update the delivery day for currentMealSelected
		const meal_selection = currentMeal.meal_selection === 'SKIP'
			? '' : currentMeal.meal_selection;
		setCurrentMeal( prev => ( {
			...prev,
			delivery_day: day === 'sunday' ? 'Sunday' : 'Monday',
			meal_selection
		} ) );
		//Check for "Select" or "Surprise" button
		// which ones is gonna be shown up
		let mealSelected = currentMeal.meals_selected;
		if ( mealSelected !== undefined && Object.keys( mealSelected ).length > 0 ) {
			// there are selected meals
			setOptionChosen( 'select' );
		} else if ( meal_selection === '' || meal_selection === 'SKIP' ) {
			clickSurprise();
		}
		// check for "Add Local Treats"
		// Should it be shown up or not
		let addonSelected = currentAddon.meal_selected;
		if ( addonSelected !== undefined && Object.keys( addonSelected ).length > 0 ) {
			setAddonChosen( true );
		}
		// update the delivery day for database
		if ( !first ) {
			//first time running, everything just keep local, not writing into database
			saveSelectMealAPI( props, currentMeal );
		}
	}
	
	function clickSkip() {
		setDayChosen( undefined );
		setOptionChosen( undefined );
		setAddonChosen( undefined );
		setButtonDisabled( [ false, false, false, true, true, true ] );
		setCurrentMeal( prev => ( {
			...prev,
			delivery_day:   'SKIP',
			meal_selection: 'SKIP'
		} ) );
		setSelectMealModal( false );
		setAddonModal( false );
		saveSelectMealAPI( props, currentMeal );
	}
	
	React.useEffect( () => {
		setTotalAddonPrice( '0' );
		setCurrentMeal( {} );
		setCurrentAddon( {} );
		//get meals and addon out of the result object
		setDayChosen( undefined );
		setOptionChosen( undefined );
		setAddonChosen( undefined );
		setButtonDisabled( undefined );
		setSelectMealModal( false );
		setAddonModal( false );
	}, [ currentPurchase.purchase_id ] );
	
	React.useEffect( () => {
		//call the server to get new meal selected
		let new_purchaseID = currentPurchase.purchase_id;
		axios
			.get( `${MEAL_SELECT_API_URL}/${new_purchaseID}` )
			.then( res => {
				let data;
				if ( res.data.result !== undefined ) {
					data = res.data.result;
					if ( data.Meals.length > 0 ) {
						for ( let meal of data.Meals ) {
							if ( meal.week_affected === weekMenu.SaturdayDate ) {
								setCurrentMeal( meal );
							}
						}
					}
					if ( data.Addons.length > 0 ) {
						for ( let addon of data.Addons ) {
							if ( addon.week_affected === weekMenu.SaturdayDate ) {
								setCurrentAddon( addon );
								//calculate the total add on price for first week
								let priceList = weekMenu.AddonPrice;
								let total = 0;
								for ( let key of Object.keys( addon.meals_selected ) ) {
									if ( priceList[ key ] !== undefined ) {
										total +=
											parseFloat( priceList[ key ] ) *
											parseFloat( addon.meals_selected[ key ] );
									}
								}
								setTotalAddonPrice( total.toFixed( 2 ) );
								total = 0;
							}
						}
					}
				}
			} )
			.then( () => {
				if ( Object.keys( currentMeal ).length === 0 ) {
					clickDay( 'sunday', true ).then();
					clickSurprise( true );
				} else if ( currentMeal.delivery_day === 'Sunday' ) {
					setDayChosen( 'sunday' );
					setButtonDisabled( undefined );
				} else if ( currentMeal.delivery_day === 'Monday' ) {
					setDayChosen( 'monday' );
					setButtonDisabled( undefined );
				} else if ( currentMeal.delivery_day === 'SKIP' ) {
					setDayChosen( undefined );
					setOptionChosen( undefined );
					setAddonChosen( undefined );
					setButtonDisabled( [ false, false, false, true, true, true ] );
				}
				if ( currentMeal.meal_selection === 'SURPRISE' ) {
					setOptionChosen( 'surprise' );
					setButtonDisabled( undefined );
				} else if (
					currentMeal.meal_selection.length > 0 &&
					currentMeal.delivery_day !== 'SKIP'
				) {
					setOptionChosen( 'select' );
					setButtonDisabled( undefined );
				}
				let mealSelection = currentAddon.meal_selection;
				if ( mealSelection !== undefined && mealSelection.length > 0 ) {
					setAddonChosen( true );
					setButtonDisabled( undefined );
				} else {
					if ( addonChosen ) {
						setAddonChosen( false );
						setButtonDisabled( undefined );
					}
				}
			} )
			.catch( err => {
				SetError( err );
			} );
	}, [ weekMenu, currentPurchase.purchase_id ] );
	
	let mealLeft = maxMeals;
	
	let mealSelected = currentMeal.meals_selected;
	if ( mealSelected !== undefined && mealSelected !== null ) {
		mealSelected = Object.values( mealSelected );
		if ( mealSelected.length > 0 ) {
			mealLeft -= mealSelected.reduce( ( a, b ) => a + b );
		}
	}
	
	function incrementMealLeft( id ) {
		let count = 1;
		if ( currentMeal.meals_selected !== undefined && id in currentMeal.meals_selected ) {
			count = currentMeal.meals_selected[ id ] + 1;
		}
		setCurrentMeal( prev => ( {
			...prev,
			meals_selected: {
				...prev.meals_selected,
				[ id ]: count
			}
		} ) );
	}
	
	function decrementMealLeft( id ) {
		if ( id in currentMeal.meals_selected ) {
			if ( currentMeal.meals_selected[ id ] >= 1 ) {
				setCurrentMeal( prev => ( {
					...prev,
					meals_selected: {
						...prev.meals_selected,
						[ id ]: prev.meals_selected[ id ] - 1
					}
				} ) );
			} else {
				alert( 'Cannot get negative meals' );
			}
		} else {
			alert( 'Cannot get negative meals' );
		}
	}
	
	return <ButtonToolbar className='mb-5'>
		<Buttons
			dayChosen={dayChosen}
			optionChosen={optionChosen}
			setOptionChosen={setOptionChosen}
			addonChosen={addonChosen}
			setAddonChosen={setAddonChosen}
			buttonDisabled={buttonDisabled}
			weekMenu={weekMenu}
			clickDay={clickDay}
			clickSurprise={clickSurprise}
			clickSkip={clickSkip}
			setSelectMealModal={setSelectMealModal}
			setAddonModal={setAddonModal}
		/>
		{/*This part is for two modal. Select Meal Modal and Add Local Treats Modal */}
		{selectMealModal && <SelectMealModal
			mealLeft={mealLeft}
			Meals={weekMenu.Meals}
			incrementMealLeft={incrementMealLeft}
			decrementMealLeft={decrementMealLeft}
			clickSkip={clickSkip}
			clickSurprise={clickSurprise}
			currentMealSelected={currentMeal}
			saveSelectMeal={() => {
				setOptionChosen( 'select' );
				setCurrentMeal( prev => ( {
					...prev,
					meal_selection: concatMealSelection( currentMeal.meal_selection, currentMeal.meals_selected )
				} ) );
			}}
		/>}
		{addonModal && <AddonModal
			totalAddonPrice={totalAddonPrice}
			closeAddonModal={() => {
				let addonSelected = currentAddon.meal_selected;
				let choose = false;
				if ( addonSelected !== undefined && Object.keys( addonSelected ).length > 0 ) {
					choose = true;
				}
				setAddonChosen( choose );
				setAddonModal( false );
				setCurrentAddon( prev => ( {
					...prev,
					meal_selection: {},
					meals_selected: {}
				} ) );
			}}
			saveButtonAddOn={() => {
				setAddonChosen( parseInt( totalAddonPrice ) !== 0 );
				setAddonModal( false );
				//check if we change the addon of the current week
				if ( currentPurchase.week_affected === weekMenu.SaturdayDate ) {
					//update parent
					console.log( 'calling changeCurrentCharge from MealButton' );
					let totalAddonPrice = parseFloat( totalAddonPrice ).toFixed( 2 );
					ChangeCurrentAddonCharge( totalAddonPrice );
				}
				
				//Update local variables
				setCurrentAddon( prev => ( {
					...prev,
					meal_selection: concatMealSelection( prev.meal_selection, prev.meal_selected )
				} ) );
				//update database
				saveAddonAPI();
			}}
			Addons={weekMenu.Addons}
			incrementAddon={( id ) => {
				let count = 1;
				if ( currentAddon.meals_selected !== undefined && id in currentAddon.meals_selected ) {
					count = currentAddon.meals_selected[ id ] + 1;
				}
				setCurrentAddon( prev => ( {
					...prev,
					meals_selected: {
						...prev.meals_selected,
						[ id ]: count
					}
				} ) );
			}}
			decrementAddon={id => {
				if ( currentAddon.meals_selected !== undefined && id in currentAddon.meals_selected ) {
					if ( currentAddon.meals_selected[ id ] >= 1 ) {
						setCurrentAddon( prev => ( {
							...prev,
							meals_selected: {
								...prev.meals_selected,
								[ id ]: prev.meals_selected[ id ] - 1
							}
						} ) );
					} else {
						alert( 'Cannot get negative addons' );
					}
				} else {
					alert( 'Cannot get negative addons' );
				}
				console.log( 'decrementMealleft is called' );
			}}
			incrementMealLeft={incrementMealLeft}
			decrementMealLeft={decrementMealLeft}
			currentAddonSelected={currentAddon}
			incrementAddonPrice={price => {
				let newTotal = ( parseFloat( totalAddonPrice ) + parseFloat( price ) )
					.toFixed( 2 );
				setTotalAddonPrice( newTotal );
			}}
			decrementAddonPrice={price => {
				let newTotal = ( parseFloat( totalAddonPrice ) - parseFloat( price ) )
					.toFixed( 2 );
				let total = parseFloat( totalAddonPrice ).toFixed( 2 );
				if ( total > 0 && newTotal >= 0 ) {
					setTotalAddonPrice( newTotal );
				}
			}}
		/>}
	</ButtonToolbar>;
}