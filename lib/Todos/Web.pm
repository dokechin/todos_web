package Todos::Web;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  my $ config = $self->plugin('Config', { file => 'todomvc.conf' });

  $self->helper(db => sub { Todos::DB->new ( $config->{db} )});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('root#index');
  $r->post('/todo')->to('todo#create');
  $r->get('/todo')->to('todo#fetch');
  $r->put('/todo/:id')->to('todo#put');
  $r->delete('/todo/:id')->to('todo#del');

}

1;
