BD.Views.Unauthenticated = BD.Views.Unauthenticated || {};

class BD.Views.Unauthenticated.Signup extends Backbone.Marionette.ItemView
  template: 'unauthenticated/signup',

  events:
    'submit form': 'signup'

  initialize: () ->
    @model = new BD.Models.UserRegistration();
    @modelBinder = new Backbone.ModelBinder();

  onRender: () ->
    @modelBinder.bind(@model, @el);

  signup: (e) ->
    e.preventDefault();

    $(@el).find('input.btn-primary').button('loading');
    $(@el).find('.alert-error').remove();
    $(@el).find('.help-block').remove();
    $(@el).find('.control-group.error').removeClass('error');

    @model.save(@model.attributes,
      success: (userSession, response) ->
        $(@el).find('input.btn-primary').button('reset');
        BD.currentUser = new BD.Models.User(response);
        BD.vent.trigger("authentication:logged_in");

      error: (userSession, response) ->
        result = $.parseJSON(response.responseText);
        $(@el).find('form').prepend(BD.Helpers.Notifications.error("Unable to complete signup."));
        _(result.errors).each( (errors,field) ->
          $('#'+field+'_group').addClass('error');
          _(errors).each( (error, i) ->
            $('#'+field+'_group .controls').append(BD.Helpers.FormHelpers.fieldHelp(error));
          )
        )

        $(@el).find('input.btn-primary').button('reset');
    )
