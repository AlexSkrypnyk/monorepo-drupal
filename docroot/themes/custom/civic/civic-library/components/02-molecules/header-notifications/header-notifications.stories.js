import {boolean, radios, text} from "@storybook/addon-knobs";
import CivicHeaderNotifications from './header-notifications.twig';
import './header-notifications.scss';
import './header-notifications.js'

/**
 * Storybook Definition.
 */
export default {
  title: 'Molecule/Alerts'
};

export const  HeaderNotifications= () => CivicHeaderNotifications({
  theme: radios(
    'Theme',
    {
      'Light': 'light',
      'Dark': 'dark',
    },
    'light',
  ),
  type: radios(
    'Type',
    {
      'Info': 'info',
      'Error': 'error',
      'Warning': 'warning',
      'Success': 'success',
    },
    'info',
  ),
  title: text('Title', 'scheduled maintenance'),
  description: text('Summary', 'Due to scheduled maintenance CivicTheme will be unavailable between 9:30 pm Thursday 21 January to 6:30 am AEDT Friday 22 January. We apologise for any inconvenience.'),
});
