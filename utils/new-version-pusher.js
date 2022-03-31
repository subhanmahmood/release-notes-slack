const Pusher = require('pusher');
const package = require('./../package.json');

// Create new pusher instance
const pusher = new Pusher({
	appId: process.env.PUSHER_APP_ID,
	key: process.env.PUSHER_APP_KEY,
	secret: process.env.PUSHER_APP_SECRET,
	cluster: process.env.PUSHER_APP_CLUSTER,
});

// Publish a new version event
pusher.trigger('private-version-owo', 'version-event', {
	version: package.version,
});
