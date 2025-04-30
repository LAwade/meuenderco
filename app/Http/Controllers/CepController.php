<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;

class CepController extends Controller
{
    public function index(string $cep)
    {
        $client = new Client();
        $url = "https://viacep.com.br/ws/{$cep}/json/";

        try {
            $response = $client->get($url);
            $data = json_decode($response->getBody(), true);

            // Verificar se o CEP é válido
            if (isset($data['erro'])) {
                return response()->json(["status" => false, "message" => 'CEP não encontrado'], 404);
            }

            return response()->json(["status" => true, "data" => $data], 200);
        } catch (RequestException $e) {
            return response()->json(["status" => false, "message" => 'Erro ao consultar, por favor verifique o código do CEP informado!'], 500);
        }
    }
}
