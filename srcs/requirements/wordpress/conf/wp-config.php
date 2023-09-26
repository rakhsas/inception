<?php
/** The base configuration for WordPress
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 */


/** The name of the database for WordPress */
define('DB_NAME', getenv('DB_NAME')); 

/** MySQL database username */
define('DB_USER', getenv('DB_USER'));

/** MySQL database password */
define('DB_PASSWORD', getenv('DB_PASSWORD'));

/** MySQL hostname */
define('DB_HOST', getenv('DB_HOST'));

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

//** Redis cache settings. */
define('WP_CACHE', true);
define('WP_CACHE_KEY_SALT', getenv('DOMAIN_NAME'));
define('WP_HOME', getenv('WORDPRESS_DOMAIN'));
define('WP_SITEURL', getenv('WORDPRESS_DOMAIN'));

//** Try Redis container */
define('WP_REDIS_HOST', getenv('REDIS_HOST'));
define('WP_REDIS_PORT', getenv('REDIS_PORT'));
// define( 'WP_REDIS_PASSWORD', 'test' );
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_READ_TIMEOUT', 1);
define('WP_REDIS_DATABASE', 0);


/** Authentication Unique Keys and Salts.
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 */

 define('AUTH_KEY',         '+{Y+wgXC]+q7E|Y}Z.zEy|47;T4Z7`8+((2ok].iX4WRas2QXC_*wqZKZ?N}?>f~');
 define('SECURE_AUTH_KEY',  '0yB,se+3W]&`1z{<dgB?|8ejAqY.=1[!-_/3Vz`YGga+SUD~QZ.l.H_~mPoNHK2m');
 define('LOGGED_IN_KEY',    '<[t|mBZ&GIHx)U`v_O3x`4Ugav p|S9r`HsJ[+ISRWy|)N}CFuu-R8u+xpp%:A]B');
 define('NONCE_KEY',        '|dnYkkF#?@4Zd;)Gz=rEngDS3u-VZYfOhB(D~nHBuGoI1`ar=T1-=InnbqL-1VV%');
 define('AUTH_SALT',        '7C;e)>}S:_**N|Om-gI6|~<V/A#8!0.?w>e:l~pQ+IM=.hq8$<X ,e8katn.px{>');
 define('SECURE_AUTH_SALT', '24)ncQzQ2yLz*VV 08U&6B+u6I4fPT-:=]F~y.p|/U>i#!ZXR!#b!~Qv1{&my~Zz');
 define('LOGGED_IN_SALT',   'vXKW$LEZ|0VYG@QqAR>zs(,*DNzYO`RE9Zk_t;2X%t}+.zW%,#HqTay%u=N}sYRC');
 define('NONCE_SALT',       'xYV?>;uMc)hqe}b}V^+Kl&v$Of|9P[G]R %hpr`I0?6BI!nG{M9CPT1GR!WfPb{F');

/** WordPress Database Table prefix. */
$table_prefix = 'wp_';

/** For developers: WordPress debugging mode. */
define( 'WP_DEBUG', true );
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);
/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>