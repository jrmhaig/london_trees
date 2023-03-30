# frozen_string_literal: true

require 'test_lib/faker/trees'

I18n.load_path += Dir[File.join('spec', 'test_lib', 'faker', 'locales', '**/*.yml')]
I18n.reload! if I18n.backend.initialized?
