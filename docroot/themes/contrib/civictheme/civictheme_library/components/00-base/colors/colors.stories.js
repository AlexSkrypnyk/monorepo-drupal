export default {
  title: 'Base/Colors',
};

export const Colors = () => {
  const vars = { ...SCSS_VARIABLES };

  const types = {};

  const csvFileName = { ...CSV_VARIABLES_FILENAME };

  // Standard colors.
  types['civictheme-colors-default'] = 'Standard colors';

  // Generate unique color variant groups to generate types from group names.
  const colorsVariants = vars['civictheme-colors-variants'].concat(vars['civictheme-colors-variants-default'].filter((item) => vars['civictheme-colors-variants'].indexOf(item) < 0));
  const colorsVariantGroups = {};
  for (const i in colorsVariants) {
    const groupName = colorsVariants[i].match(/(.*)-variant/)[1] || null;
    if (groupName) {
      if (!Object.prototype.hasOwnProperty.call(colorsVariantGroups, groupName)) {
        colorsVariantGroups[groupName] = [];
      }
      colorsVariantGroups[groupName].push(colorsVariants[i]);
    }
  }
  for (const name in colorsVariantGroups) {
    types[`civictheme-colors-variants-default-${name}`] = `${name.charAt(0).toUpperCase() + name.slice(1)} color variants`;
    vars[`civictheme-colors-variants-default-${name}`] = colorsVariantGroups[name].sort((a, b) => a.localeCompare(b, navigator.languages[0] || navigator.language, {
      numeric: true,
      sensitivity: 'base',
    }));
  }

  // Custom colors without overrides of standard colors.
  types['civictheme-colors'] = 'Custom colors';
  vars['civictheme-colors'] = vars['civictheme-colors'].filter((n) => vars['civictheme-colors-default'].indexOf(n) === -1);

  // Shades.
  types['civictheme-colors-tints'] = 'Generated Tints';
  types['civictheme-colors-shades'] = 'Generated Shades';
  types['civictheme-colors-tones'] = 'Generated Tones';

  vars['civictheme-colors-tints'] = [];
  vars['civictheme-colors-shades'] = [];
  vars['civictheme-colors-tones'] = [];
  for (let i = 0; i <= 100; i += 10) {
    vars['civictheme-colors-tints'].push(`tint-${i}`);
    vars['civictheme-colors-shades'].push(`shade-${i}`);
    vars['civictheme-colors-tones'].push(`tone-${i}`);
  }

  let html = '';
  if (Object.values(csvFileName.name)) {
    html += `<div class="example-container__csv"><a href="../dist/${csvFileName.name}" target="_blank" download>Download color map CSV</a></div>`;
  }

  let variantDocsShown = false;
  let autogeneratedDocsShown = false;
  for (const name in types) {
    if (Object.values(vars[name]).length > 0) {
      if (name.includes('variant') && !variantDocsShown) {
        html += '<div class="docs-container">Color variants is a customizable set of colors, mapped to automatically generated color tints, shades or tones by default.<br/>These can be easily re-mapped to custom values, if required.</div>';
        variantDocsShown = true;
      }

      if (name.includes('tints') && !autogeneratedDocsShown) {
        html += '<div class="docs-container">Color tint, shades and tones are automatically generated derivatives from the Primary color.</div>';
        autogeneratedDocsShown = true;
      }

      html += `<div class="example-container">`;
      html += `<div class="example-container__title">${types[name]}</div>`;
      html += `<div class="example-container__content story-colors-wrapper story-wrapper-size--large">`;
      for (const i in Object.values(vars[name])) {
        html += `<div class="example-container__content story-color--${vars[name][i]}"></div>`;
      }
      html += `</div>`;
      html += `</div>`;
    }
  }

  return html;
};
