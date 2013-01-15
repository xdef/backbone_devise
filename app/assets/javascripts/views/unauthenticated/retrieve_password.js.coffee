BD.Views.Unauthenticated = BD.Views.Unauthenticated || {};

class BD.Views.Unauthenticated.RetrievePassword extends Backbone.Marionette.ItemView
  template: 'unauthenticated/retrieve_password',

  events:
    'submit form': 'retrievePassword'

  initialize: () ->
    this.model = new BD.Models.UserPasswordRecovery();
    this.modelBinder = new Backbone.ModelBinder();

  onRender: () ->
    this.modelBinder.bind(this.model, this.el);

  retrievePassword: (e) ->
    e.preventDefault();

    $(@el).find('input.btn-primary').button('loading');
    $(@el).find('.alert-error').remove();
    $(@el).find('.alert-success').remove();

    @model.save(@model.attributes,
      success: (userSession, response) ->
        $(@el).find('form').prepend(BD.Helpers.Notifications.success("Instructions for resetting your password have been sent. Please check your email for further instructions."));
        $(@el).find('input.btn-primary').button('reset');

      error: (userSession, response) ->
        $(@el).find('form').prepend(BD.Helpers.Notifications.error("The email you entered did not match an email in our database."));
        $(@el).find('input.btn-primary').button('reset');
    )
