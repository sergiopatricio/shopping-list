# frozen_string_literal: true

# Temporary fix for zeitwerk eager-loading without ActionMailer
# https://github.com/plataformatec/devise/issues/5140
Rails.autoloaders.main.ignore("#{Gem.loaded_specs['devise'].full_gem_path}/app/mailers/devise/mailer.rb")
