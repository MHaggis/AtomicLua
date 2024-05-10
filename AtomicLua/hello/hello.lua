-- hello.lua
local ffi = require("ffi")

ffi.cdef[[
    int MessageBoxA(void *w, const char *txt, const char *cap, int type);
    void* InternetOpenA(const char* lpszAgent, unsigned long dwAccessType, const char* lpszProxyName, const char* lpszProxyBypass, unsigned long dwFlags);
    void* InternetOpenUrlA(void* hInternet, const char* lpszUrl, const char* lpszHeaders, unsigned long dwHeadersLength, unsigned long dwFlags, unsigned long dwContext);
    int InternetReadFile(void* hFile, void* lpBuffer, unsigned long dwNumberOfBytesToRead, unsigned long* lpdwNumberOfBytesRead);
    int InternetCloseHandle(void* hInternet);
]]

local wininet = ffi.load("wininet")

local hInternet = wininet.InternetOpenA("Lua", 0, nil, nil, 0)
if hInternet == nil then
    error("InternetOpenA failed")
end

local hConnect = wininet.InternetOpenUrlA(hInternet, "http://example.com", nil, 0, 0, 0)
if hConnect == nil then
    wininet.InternetCloseHandle(hInternet)
    error("InternetOpenUrlA failed")
end

local buffer = ffi.new("char[4096]")
local bytesRead = ffi.new("unsigned long[1]")

while wininet.InternetReadFile(hConnect, buffer, ffi.sizeof(buffer), bytesRead) ~= 0 and bytesRead[0] ~= 0 do
    io.write(ffi.string(buffer, bytesRead[0]))
end

wininet.InternetCloseHandle(hConnect)
wininet.InternetCloseHandle(hInternet)

ffi.C.MessageBoxA(nil, "Hello from BSG.", "Message", 0)
