package Todos::Web::Todo;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use Todos::DB;

# This action will render a template
sub create {
  my $self = shift;

  my $json = $self->req->json();
  
  $self->app->log->debug(Dumper($json));
  
  
  my $row = $self->db->insert('Todo',{title=>$json->{title},completed=>$json->{completed}});
  
  # Render template "example/welcome.html.ep" with message
  $self->render(
    json => {id=>$row->id,title=>$row->title, completed=>$row->completed});
}



sub fetch {

  my $self = shift;

  my @todos = $self->db->search('Todo');
  
  my @json = ();
  for my $todo(@todos){
      push (@json,{title=>$todo->title,id=>$todo->id,completed=>$todo->completed});
  }
  
  # Render template "example/welcome.html.ep" with message
  $self->render(json => \@json);

}


# This action will render a template
sub put {
  my $self = shift;

  my $json = $self->req->json();
  
  $self->app->log->debug(Dumper($json));
  
  
  my $count = $self->db->update('Todo',{title=>$json->{title},completed=>$json->{completed}},{id=>$self->param('id')});
  
  # Render template "example/welcome.html.ep" with message
  $self->render(json=>{});
}

# This action will render a template
sub del {
  my $self = shift;

  my $count = $self->db->delete('Todo',{id=>$self->param('id')});
  
  # Render template "example/welcome.html.ep" with message
  $self->render(json=>{});
}

1;
