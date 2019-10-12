window._ = require('lodash');
try {
    window.Cookies = require('js-cookie');
    window.Popper = require('popper.js').default;
    window.$ = window.jQuery = require('jquery');

    require('bootstrap');
    
} catch (e) {}
