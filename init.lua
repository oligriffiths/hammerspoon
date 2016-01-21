require "functions";
require "window_locations";
require "window_stashing";

-- Stash the current window positions
stashWindowPositions();

-- Include the key/window/config bindings
require 'bindings';
