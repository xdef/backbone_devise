BD.Helpers.FormHelpers = {};

BD.Helpers.FormHelpers.fieldHelp = (message) ->
  return HandlebarsTemplates['templates/shared/form_field_help']( 'message': message )
