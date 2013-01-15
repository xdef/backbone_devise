class BD.Models.UserRegistration extends Backbone.Model
  url: '/users.json',
  paramRoot: 'user',

  defaults:
    "email": "",
    "password": "",
    "password_confirmation": ""