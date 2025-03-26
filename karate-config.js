function() {
    var env = karate.env // get java system property from karate.env 'env'
  // can inject variables from ${{secrets}} when using Actions (see run-karate-tests.yml)
    var key = karate.properties['key'] 
    var fake = karate.properties['fake'] 
  // can inject URLs from ${{secrets}} when using Actions (see run-karate-tests.yml)
    var secretDev = karate.properties['secretDev'].trim() 
    var secretStg = karate.properties['secretStg'].trim() 
    karate.log('karate.env selected environment was:', env);
    
    if (!env) {
    env = 'prod'; // env can be either prod, dev, stg, etc. Default is prod
    }

  // base config
  var config = {
	env: env,
    baseUrl: `https://.....com`,
    apikey: key,
    batchSearch: `["item1","item2"]` //json format
}
  // switch environment
  if (env === 'stg')
  {
    config.baseUrl = `https://....-stg.com`;
  }
  else if (env === 'dev')
  {
    config.baseUrl = `https://....-dev.com`;
  }
  else if (env === 'secretDev')
  {
    config.baseUrl = secretDev;
  }
  else if (env === 'secretStg')
  {
    config.baseUrl = secretStg;
  }

    karate.configure('connectTimeout', 60000);
    karate.configure('readTimeout', 60000);

    return config;
}
