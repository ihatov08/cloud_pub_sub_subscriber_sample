class Api::V1::CloudPubSub::SubscribeController < ApplicationController
  def create
    
    source = Google::Auth::IDTokens::StaticKeySource.from_jwk_set jwk_set
    verifier = Google::Auth::IDTokens::Verifier.new key_source: source
    payload = verifier.verify token

    SubscribeLog.create(token: token, payload: payload, params: params)
  end

  private

  def token
    request.headers["HTTP_AUTHORIZATION"].split(" ").last
  end

  def jwk_set
    # documentation
    # https://developers.google.com/identity/protocols/oauth2/openid-connect#discovery

    # discovery document
    # https://accounts.google.com/.well-known/openid-configuration

    # json web key
    # https://www.googleapis.com/oauth2/v3/certs
    # 毎回取得しないといけないのか、保存やキャッシュできるのか？
    {
      "keys" => [{
        "e" => "AQAB",
        "kty" => "RSA",
        "use" => "sig",
        "n" => "wZJS_u_9dXgoMi-4NVaqzygfKkqBZ2aT48TrJWRQPn-kqfh-RremrbgomZNFxCEk345PU3B2TXjNTVelgEKEzpsP8bkRMi8cXyNXj3tnArqfXIHc1dzcbGIn5zqrm4KqX-hLE0d5zGQGaVKjS04xeADQO7-8CzcnatoeqO36FX6-nroEWRF-zecPzf7td7os7DvkBO4S75k5rCPMaOkwbCvzGvKtXk0Q5EZfUqRoC1fJPmChh9iIP5eRYxCKJzDsOrkYSRWVksZ0ftiVJyBYnruESbjAX_6-KwggjTxGvSGm6PgIO5no1DMeNn21977TpeL3VCr1hOjvmUficzhCfw",
        "kid" => "26129ba543c56e9fbd53dfdcb7789f8bf8f1a1a1",
        "alg" => "RS256"
      }, {
        "n" => "18O6PX88jh7TVGSVeoZqCS37Uh26lbF_OKsuIMq2zlBhEya8q66HHdQtjZAZE0oPDKPJHOqF79PkiNSgtdY35JdRY9SWeAYteYIGHc1iCqR-8tX5_BcKbA4VpACbvmQ8oXT0sLl1hqPgq-gBF-y2tCc_UzTmRRdGRIubZMGAj_qh93kGrEih7Hr2hrTmNNAXa_UIuIpxG4gm_6Dlq8WdvcKc3TSI7pRwM4XSa5QlI4gt29KzfQe6u-BA4_-VodPKUqkHP7Ya5S967615bc73-EdF-uwdsDTIVbLIxzVzLfED0tkOawQxA3AjNR-Yr7R2EWEsrpic_bq3Uvfb9ImilQ",
        "alg" => "RS256",
        "e" => "AQAB",
        "kty" => "RSA",
        "use" => "sig",
        "kid" => "252fcb97df5b6b4f6d1a885f1e63dc4a9cd230c5"
      }]
    }
  end
end
