___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community Template Gallery Developer Terms of Service available at https://developers.google.com/tag-manager/gallery-tos (or such other URL as Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Shakebug Web SDK",
  "categories": ["UTILITY", "ANALYTICS"],
  "description": "Official Shakebug bug reporting, screen recording, and crash monitoring tag for web applications.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "appKey",
    "displayName": "Shakebug App Key",
    "simpleValueType": true,
    "help": "Your Shakebug App Key from the Shakebug dashboard (e.g. Y6YSuyF46vRHUbM7SdJ9DGfz4yibA5).",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "showFloatingButton",
    "checkboxText": "Show Floating Feedback Button",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Displays the floating trigger icon on your website for users to report bugs."
  },
  {
    "type": "CHECKBOX",
    "name": "enableCrashReporting",
    "checkboxText": "Enable Automatic Crash Reporting",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Automatically captures uncaught JavaScript runtime errors and unhandled promise rejections."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const callInWindow = require('callInWindow');
const log = require('logToConsole');

const appKey = data.appKey;
const showButton = data.showFloatingButton !== false;
const enableCrash = data.enableCrashReporting !== false;

const sdkUrl = 'https://www.shakebug.com/sdk/web/v1/shakebug.min.js';

const onSuccess = function() {
  callInWindow('Shakebug.init', {
    appKey: appKey,
    showFloatingButton: showButton,
    enableCrashReporting: enableCrash
  });
  data.gtmOnSuccess();
};

const onFailure = function() {
  log('Shakebug SDK failed to load from ' + sdkUrl);
  data.gtmOnFailure();
};

injectScript(sdkUrl, onSuccess, onFailure, 'shakebug-web-sdk');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.shakebug.com/sdk/web/v1/shakebug.min.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": false
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Shakebug.init"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": false
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": false
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created for Shakebug Web SDK v1.6.