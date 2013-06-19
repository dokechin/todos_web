package Todos::DB::Schema;
use Teng::Schema::Declare;
use Mojo::JSON;

    table {
        name 'Todo';
        pk id;
        columns qw( id title completed);

        inflate qq/completed/ => sub {
            my ($col_value) = @_;
            return $col_value? Mojo::JSON->true : Mojo::JSON->false;
        };

    };

1;
