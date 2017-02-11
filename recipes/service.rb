service 'firewalld' do
  supports restart: true, status: true, reload: true
  action [:enable, :start]
end
