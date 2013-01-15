class BD.Views.Layouts.Unauthenticated extends Backbone.Marionette.Layout
  template: 'layouts/unauthenticated',
  regions:
    tabContent: '#tab-content'

  views: {}

  events:
    'click ul.nav-tabs li a': 'switchViews'


  onShow: () ->
    this.views.login = BD.Views.Unauthenticated.Login;
    this.views.signup = BD.Views.Unauthenticated.Signup;
    this.views.retrievePassword = BD.Views.Unauthenticated.RetrievePassword;
    this.tabContent.show(new this.views.login)

  switchViews: (e) ->
    e.preventDefault();
    this.tabContent.show(new this.views[$(e.target).data('content')])

BD.addInitializer( () -> BD.layouts.unauthenticated = new BD.Views.Layouts.Unauthenticated() )
