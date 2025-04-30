<template>
    <div>
        <h1>Buscar CEP</h1>
        <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
            <div class="sm:col-span-4">
                <label for="username" class="block text-sm/6 font-medium text-white">Informe o CEP:</label>
                <div class="mt-2">
                    <div
                        class="flex items-center rounded-md bg-white pl-3 outline-1 -outline-offset-1 outline-gray-300 focus-within:outline-2 focus-within:-outline-offset-2 focus-within:outline-indigo-600">
                        <input type="text" name="username" id="username" v-model="cep"
                            class="block min-w-0 grow py-1.5 pr-3 pl-1 text-base text-gray-900 placeholder:text-gray-400 focus:outline-none sm:text-sm/6"
                            placeholder="Apenas números">
                    </div>
                </div>
            </div>

            <div class="mt-2 flex items-center justify-end gap-x-6">
                <router-link to="/" class="text-sm/6 font-semibold text-white">Voltar</router-link>
                <button type="submit" @click="buscarCep"
                    class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Buscar</button>
            </div>
        </div>
        <div class="col-span-full mt-10" v-if="resultado">
            <div class="col-span-full" >
                <p class="mt-3 text-lg/6 text-white">Resultado da busca:</p>
                <p class="mt-3 text-lg/6 text-white"><strong>Estado:</strong> {{ resultado.estado }} - {{ resultado.uf}} </p>
                <p class="mt-3 text-lg/6 text-white"><strong>Cidade:</strong> {{ resultado.localidade }}</p>
                <p class="mt-3 text-lg/6 text-white"><strong>Logradouro:</strong> {{ resultado.logradouro }}</p>
                <p class="mt-3 text-lg/6 text-white"><strong>Bairro:</strong> {{ resultado.bairro }}</p>
                <p class="mt-3 text-lg/6 text-white"><strong>Parte do País:</strong> {{ resultado.regiao }}</p>
                <p class="mt-3 text-lg/6 text-white"><strong>DDD:</strong> {{ resultado.ddd }}</p>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    data() {
        return {
            cep: '',
            resultado: null
        }
    },
    methods: {
        async buscarCep() {
            this.resultado = null
            const res = await axios.get(`http://localhost:8181/api/cep/${this.cep}`)
            this.resultado = res.data.data
        }
    }
}
</script>
