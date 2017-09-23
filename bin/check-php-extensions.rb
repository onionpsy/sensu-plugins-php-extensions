#!/usr/bin/env ruby
# encoding: utf-8
#
#   check-php-extensions
#
# DESCRIPTION:
#   This plugin checks domain expiration dates using the https://jsonwhois.com API
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Any
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#   ./check-jsonwhois-domain-expiration.rb -a [YOUR API KEY] -d foo.com,bar.com
#   JSONWhoisDomainExpirationCheck WARNING: foo.com: 30 days
#
# LICENSE:
#   Copyright 2017 Patrice Salathé (patrice.salathe@gmail.com)
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.

require 'sensu-plugin/check/cli'
require 'open3'
require 'date'

class CheckPHPExtensions < Sensu::Plugin::Check::CLI
  option :extension,
    short: '-e EXTENSIONS',
    long: '--extensions EXTENSIONS',
    required: true,
    description: 'Comma-separated list of extensions'
  
  option :php,
    short: '-p PHP',
    long: '-path PHP',
    required: true,
    description: 'PHP executable',
    default: 'php'
    
  def run
    diff  = config[:extension].split(',') - get_extensions
    if diff.length > 0 then
      critical "Extension(s) #{diff.join(', ')} not loaded"
    end
    ok config[:extension]
  end
  
  def get_extensions
    stdout, stderr, status = Open3.capture3("#{config[:php]} -m")
    if status.success?
      stdout.split("\n").reject {|e| e.index(/[\[\]]/) || e.empty?}
    else
      critical stderr
    end
  rescue => e
    critical e
  end
end

