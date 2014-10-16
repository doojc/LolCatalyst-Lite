 package MyApp::View::Web;
 use Moose;
 use namespace::autoclean;

 extends 'Catalyst::View::TT';
 with 'Catalyst::View::Component::SubInclude';
 __PACKAGE__->config( TEMPLATE_EXTENSION => '.tt',
                      WRAPPER => 'wrapper.tt',
                  );
 1;
 
