node default {
  class { '::mcollective':
    middleware       => true,
    middleware_hosts => [ 'broker1.example.com' ],
  }
}
