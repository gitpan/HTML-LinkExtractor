use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'HTML::LinkExtractor',
    'VERSION_FROM'	=> 'LinkExtractor.pm', # finds $VERSION

    PREREQ_PM   => {
        'HTML::TokeParser::Simple'	=> '1.3', # or a minimum workable version
    },

    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'LinkExtractor.pm', # retrieve abstract from module
       AUTHOR     => 'A. U. Thor <a.u.thor@a.galaxy.far.far.away>') : ()),
);
