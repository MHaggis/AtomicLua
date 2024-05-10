-- Load the FFI library
local ffi = require("ffi")

-- Define the necessary Windows API functions and constants
ffi.cdef[[
    typedef void* HANDLE;
    typedef int BOOL;
    typedef unsigned long DWORD;
    typedef void* LPVOID;
    HANDLE CreateFileA(const char* lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode, void* lpSecurityAttributes, DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE hTemplateFile);
    BOOL WriteFile(HANDLE hFile, const void* lpBuffer, DWORD nNumberOfBytesToWrite, DWORD* lpNumberOfBytesWritten, void* lpOverlapped);
    BOOL CloseHandle(HANDLE hObject);
    DWORD GetFileAttributesA(const char* lpFileName);
    BOOL CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);
]]

-- Constants for file creation and access
local GENERIC_WRITE = 0x40000000
local CREATE_ALWAYS = 2
local INVALID_FILE_ATTRIBUTES = 0xFFFFFFFF
local FILE_ATTRIBUTE_DIRECTORY = 0x10

-- Load the bit library for bitwise operations
local bit = require("bit")
local band = bit.band

-- Path to the file to be created
local filename = "C:\\temp\\test.txt"

-- Check if C:\\temp exists, if not create it
local attributes = ffi.C.GetFileAttributesA("C:\\temp")
if attributes == INVALID_FILE_ATTRIBUTES or not (band(attributes, FILE_ATTRIBUTE_DIRECTORY) ~= 0) then
    if ffi.C.CreateDirectoryA("C:\\temp", nil) == 0 then
        print("Error creating directory C:\\temp")
        return
    end
end
-- Open the file using CreateFile
local hFile = ffi.C.CreateFileA(filename, GENERIC_WRITE, 0, nil, CREATE_ALWAYS, 0, nil)

if hFile == nil or hFile == ffi.cast("HANDLE", -1) then
    print("Error creating the file")
else
    -- Data to be written to the file
    local data = "hello world"

    -- Write the data to the file
    local bytesWritten = ffi.new("DWORD[1]")
    local result = ffi.C.WriteFile(hFile, data, #data, bytesWritten, nil)

    if result == 1 then
        print("File created and data written successfully.")
    else
        print("Error writing to the file.")
    end

    -- Close the file handle
    ffi.C.CloseHandle(hFile)
end