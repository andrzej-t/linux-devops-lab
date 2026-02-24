# Networking Commands

### Interface Information and Configuration
- Show all network interfaces: `ip addr show`
- Show a specific interface: `ip addr show eth0`
- Enable a network interface: `ip link set eth0 up`
- Disable a network interface: `ip link set eth0 down`
- Show interface statistics: `ip -s link`
- Show interface details (legacy): `ifconfig`
- Show all interfaces (legacy): `ifconfig -a`
- Assign IP address to interface: `ip addr add 192.168.1.10/24 dev eth0`
- Remove IP address from interface: `ip addr del 192.168.1.10/24 dev eth0`
- Show neighbor/ARP table: `ip neighbor show`
- Add static ARP entry: `ip neighbor add 192.168.1.1 lladdr 00:11:22:33:44:55 dev eth0`
- Delete ARP entry: `ip neighbor del 192.168.1.1 dev eth0`
- Show PCI network devices: `lspci | grep -i net`
- Show USB network devices: `lsusb | grep -i net`
- Monitor network device events: `ip monitor`

### Routing and Gateways
- Show routing table: `ip route show`
- Show routing table (numeric): `route -n`
- Show routing table (legacy): `netstat -rn`
- Add a default gateway: `ip route add default via 192.168.1.1`
- Delete a default gateway: `ip route del default`
- Add a static route: `ip route add 10.0.0.0/24 via 192.168.1.1`
- Delete a static route: `ip route del 10.0.0.0/24`
- Get the route taken to an IP: `ip route get 8.8.8.8`
- Show policy routing rules: `ip rule show`
- Trace path to host: `traceroute google.com`
- Trace path using ICMP: `traceroute -I google.com`
- Trace path using TCP: `traceroute -T google.com`
- Modern traceroute (mtr): `mtr google.com`
- Show path MTU: `tracepath google.com`

### Connectivity and Testing
- Ping a host: `ping google.com`
- Ping with count: `ping -c 4 google.com`
- Ping with interval: `ping -i 0.5 google.com`
- Flood ping (requires sudo): `sudo ping -f google.com`
- Check if port is open (nc): `nc -zv google.com 80`
- Scan for open ports (nmap): `nmap 192.168.1.1`
- Scan a range of IPs: `nmap 192.168.1.1-254`
- Check service banner (nc): `nc google.com 80`
- Test UDP connectivity: `nc -u -zv 192.168.1.1 53`
- Listen on a port: `nc -l 8080`

### Network Statistics and Monitoring
- Show active connections (ss): `ss -tunap`
- Show listening ports (ss): `ss -lntp`
- Show summary statistics: `ss -s`
- Show network connections (legacy): `netstat -an`
- Show listening ports (legacy): `netstat -plnt`
- Show interface traffic (nload): `nload`
- Monitor bandwidth by process (nethogs): `sudo nethogs`
- Monitor bandwidth by interface (iftop): `sudo iftop`
- Real-time network statistics (iptraf): `sudo iptraf-ng`
- Show socket statistics: `cat /proc/net/sockstat`
- Show protocol statistics: `netstat -s`

### DNS and Name Resolution
- Lookup IP for domain: `host google.com`
- Reverse DNS lookup: `host 8.8.8.8`
- Query DNS records (dig): `dig google.com`
- Query specific DNS record: `dig google.com MX`
- Query specific DNS server: `dig @8.8.8.8 google.com`
- Reverse lookup (dig): `dig -x 8.8.8.8`
- Short answer (dig): `dig google.com +short`
- DNS lookup (nslookup): `nslookup google.com`
- Flush DNS cache (systemd): `sudo resolvectl flush-caches`
- Show DNS statistics: `resolvectl statistics`
- Show current DNS servers: `resolvectl status`

### Port and Service Auditing
- List open files/ports: `lsof -i`
- List ports for specific process: `lsof -i -a -p 1234`
- List all TCP ports: `lsof -iTCP`
- List all UDP ports: `lsof -iUDP`
- Find process using port 80: `fuser 80/tcp`
- Kill process using port 80: `fuser -k 80/tcp`

### Packet Capture and Analysis
- Capture traffic on eth0: `sudo tcpdump -i eth0`
- Capture and save to file: `sudo tcpdump -i eth0 -w capture.pcap`
- Read from pcap file: `tcpdump -r capture.pcap`
- Capture traffic for specific IP: `sudo tcpdump host 192.168.1.1`
- Capture traffic for specific port: `sudo tcpdump port 80`
- Capture ASCII content: `sudo tcpdump -A`
- Show traffic in hex: `sudo tcpdump -X`
- Monitor traffic in real-time (tshark): `tshark -i eth0`

### File Transfer and Downloads
- Download file: `wget http://example.com/file`
- Resume download: `wget -c http://example.com/file`
- Mirror a website: `wget -m http://example.com`
- Download with curl: `curl -O http://example.com/file`
- Send POST request: `curl -X POST -d "data" http://example.com`
- Show response headers: `curl -I http://example.com`
- Upload file via FTP: `curl -T file.txt ftp://example.com --user user:pass`
- Secure copy (SCP): `scp file.txt user@host:/path`
- Recursive SCP: `scp -r dir user@host:/path`
- Synchronize via rsync: `rsync -avz local/ user@host:/remote/`

### Remote Access and Shells
- Connect via SSH: `ssh user@host`
- Connect on specific port: `ssh -p 2222 user@host`
- Execute remote command: `ssh user@host "ls -l"`
- Copy SSH key to server: `ssh-copy-id user@host`
- Tunnel local port to remote: `ssh -L 8080:localhost:80 user@host`
- Tunnel remote port to local: `ssh -R 8080:localhost:80 user@host`
- Connect via Telnet (not secure): `telnet host port`

### Wireless Networking
- List wireless interfaces: `iwconfig`
- Scan for WiFi networks: `sudo iw dev wlan0 scan | grep SSID`
- Show WiFi status: `nmcli radio wifi`
- List WiFi networks (nmcli): `nmcli dev wifi list`
- Connect to WiFi: `nmcli dev wifi connect "SSID" password "PASS"`
- Show WiFi link quality: `watch -n 1 cat /proc/net/wireless`

### Network Configuration (NMCLI)
- Show all connections: `nmcli connection show`
- Show active connections: `nmcli connection show --active`
- Bring up a connection: `nmcli connection up id "Home"`
- Bring down a connection: `nmcli connection down id "Home"`
- Show device status: `nmcli device status`
- Show device details: `nmcli device show eth0`

### Firewall and Security (IPtables/UFW)
- List iptables rules: `sudo iptables -L -n -v`
- Block an IP: `sudo iptables -A INPUT -s 192.168.1.100 -j DROP`
- Allow port 80: `sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT`
- Flush iptables rules: `sudo iptables -F`
- Check UFW status: `sudo ufw status`
- Enable UFW: `sudo ufw enable`
- Allow SSH in UFW: `sudo ufw allow ssh`
- Deny an IP in UFW: `sudo ufw deny from 192.168.1.100`

### Advanced Networking and Tunneling
- Show bridge information: `brctl show`
- List network namespaces: `ip netns list`
- Execute command in namespace: `ip netns exec myns ip addr`
- Create a VETH pair: `ip link add veth0 type veth peer name veth1`
- Show listening UNIX sockets: `ss -x -l`
- Network performance test (iperf): `iperf3 -c 192.168.1.1`
- Run iperf server: `iperf3 -s`
- Show current hostname: `hostnamectl`
- Set new hostname: `sudo hostnamectl set-hostname myserver`
- View /etc/hosts: `cat /etc/hosts`
- View /etc/resolv.conf: `cat /etc/resolv.conf`
