use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'HTML::LinkExtractor',
    'VERSION_FROM'	=> 'LinkExtractor.pm', # finds $VERSION

    PREREQ_PM   => {
        'HTML::TokeParser::Simple'	=> '2', # or a minimum workable version
    },

    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'LinkExtractor.pm', # retrieve abstract from module
       AUTHOR     => 'PodMaster') : ()),
);

# perl Makefile.PL && nmake realclean && cls && perl Makefile.PL && nmake test
# cpan-upload -mailto o@o.o -verbose -user podmaster HTML-LinkExtractor-0.09.tar.gz
