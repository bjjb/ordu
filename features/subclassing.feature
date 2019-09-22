Feature: Ordu::Base subclass
  One convenient way to write a complex command-line application is to simply
  subclass Ordu::Base, and to then execute that class via `parse`.

  Scenario: Writing a standalone echo program
    Given a file "myecho" with contents
    """
    #!/usr/bin/env ruby
    require 'ordu'
    class Echo < Ordu::Base
      name 'myecho'
      version '0.0.1'
      option '-n', 'do not output the trailing newline'
      action { options[:n] ?  print ARGF.read : puts ARGF.read }
    end
    """
    When I run "myecho foo bar"
    Then I should see
    """
    foo bar

    """
    When I run "myecho -n foo bar"
    Then I should see 
    """
    foo bar
    """
    When I run "myecho --version"
    Then I should see 
    """
    myecho -v0.0.1

    """
    When I run "myecho --help"
    Then I should see
    """
    write me
    """

