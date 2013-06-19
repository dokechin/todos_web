package Todos::Web::Root;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
  my $self = shift;

  # Render template "root/index.html.ep"
  $self->render();
}


1;
