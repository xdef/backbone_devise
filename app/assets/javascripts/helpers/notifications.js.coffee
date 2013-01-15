BD.Helpers.Notifications = {};

BD.Helpers.Notifications.alert = (alertType, message) ->
  return HandlebarsTemplates['templates/shared/notifications'](
    'alertType': alertType,
    'message': message
  )

BD.Helpers.Notifications.error = (message) ->
  return @alert('error', message);

BD.Helpers.Notifications.success = (message) ->
  return @alert('success', message);

Handlebars.registerHelper('notify_error', (msg) ->
  msg = Handlebars.Utils.escapeExpression(msg);
  return new Handlebars.SafeString(BD.Helpers.Notifications.error(msg)) )

Handlebars.registerHelper('notify_success', (msg) ->
  msg = Handlebars.Utils.escapeExpression(msg);
  return new Handlebars.SafeString(BD.Helpers.Notifications.success(msg)) )
