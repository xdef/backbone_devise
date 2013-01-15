BD.Views.Unauthenticated = BD.Views.Unauthenticated || {};

class BD.Views.Unauthenticated.Login extends Backbone.Marionette.ItemView
  template: 'unauthenticated/login',

  events:
    'submit form': 'login'

  initialize: () ->
    this.model = new BD.Models.UserSession();
    this.modelBinder = new Backbone.ModelBinder();

  onRender: () ->
    this.modelBinder.bind(this.model, this.el);

  login: (e) ->
    e.preventDefault();

    $(@el).find('input.btn-primary').button('loading');
    $(@el).find('.alert-error').remove();

    @model.save(@model.attributes,
      success: (userSession, response) ->
        $(@el).find('input.btn-primary').button('reset');
        BD.currentUser = new BD.Models.User(response);
        BD.vent.trigger("authentication:logged_in");

      error: (userSession, response) ->
        result = $.parseJSON(response.responseText);
        $(@el).find('form').prepend(BD.Helpers.Notifications.error(result.error));
        $(@el).find('input.btn-primary').button('reset') )