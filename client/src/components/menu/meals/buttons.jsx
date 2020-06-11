import { Button } from 'react-bootstrap';
import React from 'react';

import { clear, green, orange } from './colors';


export default function Buttons( props ) {
	const {
		      dayChosen,
		      optionChosen,
		      setOptionChosen,
		      addonChosen,
		      setAddonChosen,
		      buttonDisabled,
		      weekMenu,
		      clickDay,
		      clickSurprise,
		      clickSkip,
		      setSelectMealModal,
		      setAddonModal
	      } = props;
	
	return <>
		<div className='radio' style={{ position: 'relative' }}>
			<Button
				variant='outline-dark'
				disabled={buttonDisabled && buttonDisabled[ 0 ]}
				onClick={() => clickDay( 'sunday', false )}
				style={dayChosen === 'sunday' ? green : clear}>
				Sunday
				<div>{weekMenu.Sunday}</div>
			</Button>
			&nbsp;
			<Button
				variant='outline-dark'
				disabled={buttonDisabled && buttonDisabled[ 1 ]}
				onClick={() => clickDay( 'monday', false )}
				style={dayChosen === 'monday' ? green : clear}>
				Monday
				<div>{weekMenu.Monday}</div>
			</Button>
			&nbsp;
			<Button
				disabled={buttonDisabled && buttonDisabled[ 2 ]}
				variant='outline-dark'
				style={dayChosen === undefined ? orange : clear}
				onClick={clickSkip}>
				Skip This Week
			</Button>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<Button
			disabled={buttonDisabled && buttonDisabled[ 3 ]}
			variant='outline-dark'
			style={optionChosen === 'select' ? green : clear}
			onClick={() => {
				setOptionChosen( 'select' );
				setSelectMealModal( true );
			}}>
			Select Meal
		</Button>
		&nbsp;
		<Button
			disabled={buttonDisabled && buttonDisabled[ 4 ]}
			variant='outline-dark'
			onClick={clickSurprise}
			style={optionChosen === 'surprise' ? green : clear}>
			Surprise Me!
		</Button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<Button
			disabled={buttonDisabled && buttonDisabled[ 5 ]}
			variant='outline-dark'
			style={addonChosen ? orange : clear}
			onClick={() => {
				setAddonChosen( true );
				setAddonModal( true );
			}}>
			Add Local Treats
		</Button>
	</>;
}