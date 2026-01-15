{
  plugins.avante = {
    enable = true;
    settings = {
      auto_suggestions_provider = "copilot";
      selector = {
        provider = "snacks";
      };
      input = {
        provider = "snacks";
      };
      provider = "copilot";
      # copilot = {
      #   model = "claude-3.7-sonnet";
      #   endpoint = "https://api.githubcopilot.com";
      #   allow_insecure = false;
      #   timeout = 10 * 60 * 1000;
      #   temperature = 0;
      #   max_completion_tokens = 1000000;
      #   reasoning_effort = "high";
      # };
    };
  };
}
