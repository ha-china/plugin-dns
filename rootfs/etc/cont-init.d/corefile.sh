#!/usr/bin/with-contenv bashio
# ==============================================================================
# Handle corefile generation
# ==============================================================================

apply_china_fallback_dns() {
    if [ ! -f /etc/corefile ]; then
        return
    fi

    sed -i \
        -e 's/forward \. tls:\/\/1\.1\.1\.1 tls:\/\/1\.0\.0\.1 {/forward . dns:\/\/223.5.5.5 dns:\/\/223.6.6.6 {/' \
        -e '/tls_servername cloudflare-dns\.com/d' \
        /etc/corefile
}

# Generate corefile
if ! tempio \
        -conf /config/coredns.json \
        -template /usr/share/tempio/corefile \
        -out /etc/corefile
then
    bashio::log.error "Corefile fails to generate. Use fallback corefile!"
fi

apply_china_fallback_dns
