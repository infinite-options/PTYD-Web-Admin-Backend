import { Button } from 'react-bootstrap';
import React from 'react';

import { clear, green, orange } from './colors';


export default function Buttons( props ) {
	const {
		      buttonChosen,
		      setButtonChosen,
		      buttonDisabled,
		      setButtonDisabled,
		      weekMenu,
		      clickDay,
		      clickSurprise,
		      clickSkip,
		      setSelectMealModal,
		      setAddonModal
	      } = props;
	
	// defined color for buttons
	let selectColor, addonColor;
	
	//select button
	if ( buttonChosen === 'select' ) {
		selectColor = /*selectButton.red ? red :*/ green;
	} else {
		selectColor = clear;
	}
	//addon button
	if ( buttonChosen === 'addon' ) {
		addonColor = /*addonButton.red ? red :*/ orange;
	} else {
		addonColor = clear;
	}
	
	return <>
		<div className='radio' style={{ position: 'relative' }}>
			<Button
				variant='outline-dark'
				disabled={buttonDisabled && buttonDisabled[ 0 ]}
				onClick={() => clickDay( 'sunday', false )}
				style={buttonChosen === 'sunday' ? green : clear}>
				Sunday
				<div>{weekMenu.Sunday}</div>
			</Button>
			&nbsp;
			<Button
				variant='outline-dark'
				disabled={buttonDisabled && buttonDisabled[ 1 ]}
				onClick={() => clickDay( 'monday', false )}
				style={buttonChosen === 'monday' ? green : clear}>
				Monday
				<div>{weekMenu.Monday}</div>
			</Button>
			&nbsp;
			<Button
				disabled={buttonDisabled && buttonDisabled[ 2 ]}
				variant='outline-dark'
				style={buttonChosen === 'skip' ? orange : clear}
				onClick={clickSkip}>
				Skip This Week
			</Button>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<Button
			disabled={buttonDisabled && buttonDisabled[ 3 ]}
			variant='outline-dark'
			style={selectColor}
			onClick={() => {
				setButtonChosen( 'select' );
				setButtonDisabled( undefined );
				setSelectMealModal( true );
			}}>
			Select Meal
		</Button>
		&nbsp;
		<Button
			disabled={buttonDisabled && buttonDisabled[ 4 ]}
			variant='outline-dark'
			onClick={clickSurprise}
			style={buttonChosen === 'surprise' ? green : clear}>
			Surprise Me!
		</Button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<Button
			disabled={buttonDisabled && buttonDisabled[ 5 ]}
			variant='outline-dark'
			style={addonColor}
			onClick={() => {
				setButtonChosen( 'addon' );
				setButtonDisabled( undefined );
				setAddonModal( true );
			}}>
			Add Local Treats
		</Button>
	</>;
}