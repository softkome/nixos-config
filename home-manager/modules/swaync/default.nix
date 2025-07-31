{ lib, config, ... }: {
  options = {
    swayncMod = lib.mkEnableOption "Enable custom swaync styling and configuration";
  };

  config = lib.mkIf config.swayncMod {
    services.swaync = {
      enable = true;

      style = lib.mkForce ''
        * {
          all: unset;
          font-family: "Sans", sans-serif;
          font-size: 12pt;
          color: #EBDBB2;
          background-color: transparent;
        }

        .notification {
          background-color: #1D2021;
          color: #EBDBB2;
          margin: 6px;
          padding: 4px 6px;  /* smaller padding for floating popups */
          border: none;
          border-radius: 0;
          box-shadow: none;
        }

        .notification .title,
        .notification .body,
        .notification .icon {
          color: #EBDBB2;
          padding: 4px;
        }

        .notification .button {
          background-color: #1D2021;
          color: #EBDBB2;
          border: none;
          margin: 4px;
          padding: 6px 10px;
          border-radius: 0;
        }

        .notification .button:hover {
          background-color: #3c3836;
          color: #fbf1c7;
        }

        .notification-row {
          background-color: #1D2021;
          color: #EBDBB2;
          margin: 6px;
          padding: 8px;
          border: none;
          border-radius: 0;
          box-shadow: none;
        }

        .notification-row .summary,
        .notification-row .body,
        .notification-row .app-name,
        .notification-row .time {
          color: #EBDBB2;
        }

        .control-center {
          background-color: #1D2021;
          color: #EBDBB2;
          border: none;
          margin: 6px;
          padding: 8px;
          border-radius: 0;
        }

        .control-center .header {
          font-weight: bold;
          padding: 4px;
        }

        .control-center .dnd {
          background-color: #1D2021;
          color: #EBDBB2;
          border: none;
          padding: 6px 10px;
          margin: 6px 0;
        }

        .control-center .dnd:hover {
          background-color: #3c3836;
          color: #fbf1c7;
        }

        .control-center .clear-all {
          background-color: #1D2021;
          color: #EBDBB2;
          border: none;
          padding: 6px 10px;
          margin: 6px 0;
        }

        .control-center .clear-all:hover {
          background-color: #3c3836;
          color: #fbf1c7;
        }

        .close-button {
          min-width: 20px;
          min-height: 20px;
          margin: 4px;
          padding: 4px;
          background-color: transparent;
          color: #EBDBB2;
        }

        .close-button:hover {
          background-color: #3c3836;
          color: #fbf1c7;
        }

        .close-button image {
          color: inherit;
        }

	.dnd {
	  background-color: #1D2021;
	  color: #EBDBB2;
	  padding: 8px;
	  margin: 4px;
	  border: none;
	  border-radius: 0;
	}

	.dnd:hover {
	  background-color: #3c3836; /* a lighter Gruvbox background */
	  color: #FBF1C7;
	  cursor: pointer;
	}

      '';

      settings = {
        position = "top-right";
        control-center-position = "right";

        control-center-margin-top = 0;
        control-center-margin-bottom = 0;
        control-center-margin-left = 0;
        control-center-margin-right = 0;

	dnd-toggle-visible = true;

        layer = "overlay";
      };
    };
  };
}

