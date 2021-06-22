# frozen_string_literal: true

module Drivers
  module Db
    class Postgresql < Base
      adapter :postgresql
      allowed_engines :postgres, :postgresql, :'aurora-postgresql'
      packages debian: 'libpq-dev', rhel: 'postgresql12-devel'

      def setup
        super
        context.link '/etc/alternatives/pg_config' do
          to '/usr/pgsql-12/bin/pg_config'
        end
        context.link '/usr/bin/pg_config' do
          to '/etc/alternatives/pg_config'
        end
      end
      
    end
  end
end
