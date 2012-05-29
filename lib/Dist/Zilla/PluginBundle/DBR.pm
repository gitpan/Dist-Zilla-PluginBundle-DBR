package Dist::Zilla::PluginBundle::DBR;
{
  $Dist::Zilla::PluginBundle::DBR::VERSION = '0.020';
}
BEGIN {
  $Dist::Zilla::PluginBundle::DBR::AUTHORITY = 'cpan:DBR';
} # Make CPAN happy

#  PODNAME: Dist::Zilla::PluginBundle::DBR
# ABSTRACT: DBRs Dist::Zilla PluginBundle

use MooseX::Declare;

class Dist::Zilla::PluginBundle::DBR with Dist::Zilla::Role::PluginBundle::Easy {
    use Dist::Zilla::PluginBundle::Filter;

    method configure {

        $self->add_bundle(
            Filter => {
                -bundle => '@Classic',
                -remove => [qw/MakeMaker PkgVersion PodVersion Readme/],
            }
        );

        $self->add_plugins(
            'ConfirmRelease',
            'EOLTests',
            'MetaJSON',
            'ModuleBuild',
            'NoTabsTests',
            'PkgVersion',
            'PodCoverageTests',
            'PodSyntaxTests',
            'ReadmeFromPod',
            'TestRelease',
        );
    }
}



=pod

=head1 NAME

Dist::Zilla::PluginBundle::DBR - DBRs Dist::Zilla PluginBundle

=head1 VERSION

version 0.020

=head1 SYNOPSIS

This PluginBundle is roughly equivalent to the following C<dist.ini>:

  # dist.ini
  [@Basic]
  [Authority]
      authority = cpan:DBR

  [AutoPrereqs]
  [PkgVersion]
  [PodCoverageTests]
  [PodSyntaxTests]
  [NoTabsTests]
  [EOLTests]
  [Test::Compile]
  [TestRelease]
  [ConfirmRelease]
  [PodWeaver]

=head1 AUTHOR

Daniel Bruder <dbr@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Daniel B..

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

