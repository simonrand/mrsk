class Mrsk::Cli::Server < Mrsk::Cli::Base
  desc "bootstrap", "Ensure Docker is installed on servers"
  def bootstrap
    on(MRSK.hosts + MRSK.accessory_hosts) do
      # TODO: Should only run update once
      execute "which curl || (apt-get update -y && apt-get install curl -y)"
      execute "which docker || (apt-get update -y && apt-get install docker.io -y)"
    end
  end
end
